package com.yjg.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjg.entity.ChainShop;
import com.yjg.entity.Desk;
import com.yjg.entity.Restaurant;
import com.yjg.entity.User;
import com.yjg.service.ChainShopService;
import com.yjg.service.DeskService;
import com.yjg.service.OrderService;
import com.yjg.service.RestaurantAndUserService;
import com.yjg.service.RestaurantService;
import com.yjg.service.UserService;
import com.yjg.tools.JSchUtil;
import com.yjg.vo.DeskList;
import com.yjg.vo.RestaurantAndUser;

/**
 * Created by ljh on 2017/11/21.
 */
@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private ChainShopService chainShopService;

    //引用图片上传类
    @Resource
    private JSchUtil jSchUtil;

    @Autowired
    private RestaurantAndUserService restaurantAndUserService;

    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private DeskService deskService;

    @Autowired
    private UserService userService;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    //添加餐厅信息
    @RequestMapping("/addRestaurant")
    public String addRestaurant(Restaurant restaurant, HttpServletRequest request,
                                HttpServletResponse response, DeskList desks, HttpSession session, @RequestParam("coverPicFile") MultipartFile coverPic, @RequestParam("navPicFile") MultipartFile[] navPic) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        //判断用户为商家还是管理员
        if(restaurant.getUserId()==null) {
            Subject currentUser = SecurityUtils.getSubject();
            Session shiroSession = currentUser.getSession();
            //保存用户id用于判断显示不同添加框
            restaurant.setUserId((int) shiroSession.getAttribute("userId"));
        }
        //门面图数据库存储数据
        String coverFileName="";
        //判断文件名字是否为空
        if(StringUtils.isNoneBlank(coverPic.getOriginalFilename())) {
            //不为空长传
            coverFileName = jSchUtil.uploadFile(coverPic);
            //数据封装到对象对应属性里面
            restaurant.setCoverPic(coverFileName);
        }

        //判断集合是否为空
        if(navPic!=null){
            //导航图数据库存储数据
            String navFileNames="";
            //循环集合
            for(int i=0;i<navPic.length;i++)
            {
                //导航图属性值
                String navFileName="";
                //将集合中文件赋值个新文件对象
                MultipartFile navPicFiles=navPic[i];
                //判断文件名是否不为空
                if(StringUtils.isNoneBlank(navPicFiles.getOriginalFilename()))
                {
                    //上传文件并返回数据天剑逗号分隔
                    navFileName=jSchUtil.uploadFile(navPicFiles)+",";
                }
                //数据库对应属性数据添加
                navFileNames=navFileNames+navFileName;

            }
            //判断导航图属性值是否部位空
            if(StringUtils.isNoneBlank(navFileNames))
            {
                //去除最后一个逗号
                navFileNames=navFileNames.substring(0,navFileNames.length()-1);
                //存入对象对应导航图属性
                restaurant.setNavPic(navFileNames);
            }
        }
        //保存餐厅
        restaurantService.addRestaurant(restaurant);
        //保存餐厅对应桌子
        List<Desk> deskList=desks.getDesks();
        for (Desk desk:deskList) {
            //获得添加餐厅后自增餐厅标识
            desk.setRestId(restaurant.getId());
            if(StringUtils.isBlank(desk.getInfo())){
                desk.setInfo("0");
            }
                deskService.addDesk(desk);
        }
        return "/mainFrame/restaurantManager/successOfResManager.jsp";

    }
    //查找所有餐厅
    @RequestMapping("/queryRestaurantList")
    public String queryRestaurantList(@RequestParam(required=true,defaultValue="1") Integer page,Model model) throws Exception {

        //获取session
        Subject currentUser = SecurityUtils.getSubject();
        Session shiroSession = currentUser.getSession();

        //判断session中的userid是否为空
        if(shiroSession.getAttribute("userId")==null) {
            //获取所有user对象
            List<User> userList=userService.userList();
            //分页开始
            PageHelper.startPage(page,10);
            //查询所有餐厅包括餐厅用户的真实姓名
            List<RestaurantAndUser> list = restaurantAndUserService.listRU();
            //对获取的所有餐厅进行分页
            PageInfo<RestaurantAndUser> p=new PageInfo<RestaurantAndUser>(list);
            model.addAttribute("page",p);
            model.addAttribute("list",list);
            model.addAttribute("userList",userList);
            id=0;
            model.addAttribute("uid",id);


            return "/mainFrame/restaurantManager/restaurantList.jsp";
        }else
        {
            id=(int)shiroSession.getAttribute("userId");
            PageHelper.startPage(page,10);
            //根据userid查询该id下的所有餐厅信息
            List<RestaurantAndUser> list=restaurantAndUserService.listRuById(id);
            PageInfo<RestaurantAndUser> p=new PageInfo<RestaurantAndUser>(list);
            model.addAttribute("page",p);
            model.addAttribute("list",list);
            model.addAttribute("uid",id);
            return "/mainFrame/restaurantManager/restaurantList.jsp";
        }
    }
    //根据id查询餐厅信息
    @RequestMapping("/queryRestaurantById")
    public String queryOrderById(int id,Model model,int pageNumber){


        //根据餐厅id查询餐厅信息
        RestaurantAndUser restauant=restaurantAndUserService.listByRsId(id);
        //根据餐厅id查询对应桌子信息
        List<Desk> desklists=deskService.queryDeskAll(id);
        model.addAttribute("desklists",desklists);
        model.addAttribute("restaurant",restauant);
        model.addAttribute("pageNumber",pageNumber);
        List<ChainShop> listChainShop=chainShopService.chainShopList();
        model.addAttribute("listChainShop",listChainShop);
        return "/mainFrame/restaurantManager/restaurantDetail.jsp";

    }
    //根据id删除餐厅信息
    @RequestMapping("/delete")
    public String deleteOrder(int size,int id, HttpServletResponse response,int pageNumber,Model model) throws Exception {
        //根据餐厅id删除餐厅信息
        restaurantService.deleteRestaurant(id);
        //判断跳转页面
        if(size==1)
        {
            return queryRestaurantList(pageNumber-1,model);
        }
        else
        {
            return queryRestaurantList(pageNumber,model);
        }

    }
    //根据id修改餐厅信息
    @RequestMapping("/update")
    public String update(DeskList desks,String newadress,HttpServletRequest request, HttpServletResponse response, Restaurant restaurant, int id, @RequestParam("pictureFile1") MultipartFile pictureFile1, @RequestParam("pictureFile2")MultipartFile[] pictureFile2) throws Exception {

        //判断是否选址了新地址
        if(StringUtils.isNoneBlank(newadress)){
            //修改地址
            restaurant.setAddress(newadress);

        }else
        {
            //保持原来地址不变
            restaurant.setAddress(restaurant.getAddress());

        }
        //修改门面图
            String coverFileName = "";
            if (StringUtils.isNoneBlank(pictureFile1.getOriginalFilename())) {
                //文件不为空是上传
                coverFileName = jSchUtil.uploadFile(pictureFile1);
                //保存对象对应门面图数据
                restaurant.setCoverPic(coverFileName);

            }
            //修改导航图，定义一个用来存储导航图属性值的变量
            String navShuJukus = "";
            //原来的导航图属性值
            String navFileNames = restaurant.getNavPic();
            //定义属性值数组
            String[] navFileName = new String[3];
            //分割原来的导航图属性值
            String array[] = navFileNames.split(",");
            //一一赋值
            if (array.length < 3) {
                for (int k = 0; k < array.length; k++) {
                    navFileName[k] = array[k];

                }
            } else {
                navFileName = array;
            }
            for (int i = 0; i < 3; i++) {
                //新的导航图属性值
                String navShuJuku = "";
                //将获取到的文件赋值给新建文件对象
                MultipartFile navFile = pictureFile2[i];
                //判断文件名是否为不为空
                if (StringUtils.isNoneBlank(navFile.getOriginalFilename())) {
                    //上传文件，并获得新值
                    navShuJuku = jSchUtil.uploadFile(navFile) + ",";
                } else {
                    //保持原来属性值，并加逗号隔开
                    if (StringUtils.isNoneBlank(navFileName[i])) {
                        navShuJuku = navFileName[i] + ",";
                    }
                }
                //新导航图属性值
                navShuJukus = navShuJukus + navShuJuku;

            }
            //去处最后一个逗号
            navShuJukus = navShuJukus.substring(0, navShuJukus.length() - 1);
            //保存导航图属性值
            restaurant.setNavPic(navShuJukus);
            //修改餐厅
            restaurantService.update(restaurant);
            //修改桌子
            List<Desk> deskList=desks.getDesks();
            for(Desk desk:deskList){
                if(desk.getInfo().equals(""))
                {
                    desk.setInfo("0");
                }
                deskService.update(desk);
            }
            return "/mainFrame/restaurantManager/successOfResManager.jsp";
    }
    private List<Integer> ids;

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    //批量删除
    @RequestMapping("/deleteAll")
    public String deleteALL(int size,int pageNumber,Integer[] ids,Model model) throws Exception {

        //根据id集合逐个删除餐厅并删除餐厅对应的订单以及桌子信息
        for(int id:ids){
            //删除餐厅
            restaurantService.deleteRestaurant(id);

        }
        if(ids.length==size)
        {
            return queryRestaurantList(pageNumber-1,model);
        }else
        {
            return queryRestaurantList(pageNumber,model);
        }



    }
    //餐厅详情页面的删除餐厅
    @RequestMapping("/deleteOne")
    public String deleteOrderOne(int id,Model model,Integer pageNumber) throws Exception {
        restaurantService.deleteRestaurant(id);
        return queryRestaurantList(pageNumber, model);

    }
    //判断管理员或商家的添加页面显示
    @RequestMapping("/addFilter")
    public String addFilter(Integer uId, Model model)
    {
        if(uId==0)
        {
            //查询所有用户由于管理员添加餐厅时可以选着对应的商家
            List<User> listUser=userService.userList();
            List<ChainShop> listChainShop=chainShopService.chainShopList();
            model.addAttribute("listChainShop",listChainShop);
            model.addAttribute("uid",uId);
            model.addAttribute("listUser",listUser);
            return "/mainFrame/restaurantManager/addRestaurant.jsp";

        }
        else {
            List<ChainShop> listChainShop=chainShopService.chainShopList();
            model.addAttribute("listChainShop",listChainShop);
            model.addAttribute("uid",uId);
            return "/mainFrame/restaurantManager/addRestaurant.jsp";
        }

    }

}
