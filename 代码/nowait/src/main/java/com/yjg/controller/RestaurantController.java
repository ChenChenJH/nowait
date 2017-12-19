package com.yjg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjg.entity.ChainShop;
import com.yjg.entity.Desk;
import com.yjg.entity.Restaurant;
import com.yjg.entity.User;
import com.yjg.service.*;
import com.yjg.tools.JSchUtil;
import com.yjg.vo.RestaurantAndUser;
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


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
    @Autowired
    private ChainShopService chainShopService;

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
                              HttpServletResponse response, Desk desk, HttpSession session,@RequestParam("coverPicFile") MultipartFile coverPic,@RequestParam("navPicFile") MultipartFile[] navPic) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        if(restaurant.getUserId()==null) {
            Subject currentUser = SecurityUtils.getSubject();
            Session shiroSession = currentUser.getSession();
            restaurant.setUserId((int) shiroSession.getAttribute("userId"));
        }

        String coverFileName="";
        if(StringUtils.isNoneBlank(coverPic.getOriginalFilename())) {
            coverFileName = jSchUtil.uploadFile(coverPic);
            restaurant.setCoverPic(coverFileName);
        }

        if(navPic!=null){
            String navFileNames="";
            for(int i=0;i<navPic.length;i++)
            {
                String navFileName="";
                MultipartFile navPicFiles=navPic[i];
                if(StringUtils.isNoneBlank(navPicFiles.getOriginalFilename()))
                {
                    navFileName=jSchUtil.uploadFile(navPicFiles)+",";
                }
                navFileNames=navFileNames+navFileName;
                System.out.println(navFileNames);
            }
            if(StringUtils.isNoneBlank(navFileNames))
            {
                navFileNames=navFileNames.substring(0,navFileNames.length()-1);
                restaurant.setNavPic(navFileNames);
            }
        }
        restaurantService.addRestaurant(restaurant);
        desk.setRestId(restaurant.getId());

        System.out.println(desk.getRestId());
        deskService.addDesk(desk);

        return "/mainFrame/restaurantManager/successOfResManager.jsp";




    }
    //查找所有餐厅
    @RequestMapping("/queryRestaurantList")
    public String queryRestaurantList(@RequestParam(required=true,defaultValue="1") Integer page,Model model) throws Exception {


        Subject currentUser = SecurityUtils.getSubject();
        Session shiroSession = currentUser.getSession();

        if(shiroSession.getAttribute("userId")==null) {
            List<User> userList=userService.userList();
            PageHelper.startPage(page,10);
            List<RestaurantAndUser> list = restaurantAndUserService.listRU();
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

        //从request中获取请求值
//        String sid=request.getParameter("id");
//        Integer id=Integer.valueOf(sid);
        //根据id查询所有订单
        RestaurantAndUser restauant=restaurantAndUserService.listByRsId(id);

        model.addAttribute("restaurant",restauant);
        model.addAttribute("pageNumber",pageNumber);
        return "/mainFrame/restaurantManager/restaurantDetail.jsp";

    }
    //根据id删除餐厅信息
    @RequestMapping("/delete")
    public String deleteOrder(int id, HttpServletResponse response,int pageNumber,Model model) throws Exception {
        restaurantService.deleteRestaurant(id);
        return queryRestaurantList(pageNumber,model);



    }
    //根据id修改餐厅信息
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, Restaurant restaurant, int id, @RequestParam("pictureFile1") MultipartFile pictureFile1, @RequestParam("pictureFile2")MultipartFile[] pictureFile2) throws Exception {

        String coverFileName="";
        if(StringUtils.isNoneBlank(pictureFile1.getOriginalFilename()))
        {
            coverFileName=jSchUtil.uploadFile(pictureFile1);
            restaurant.setCoverPic(coverFileName);

        }


        String navShuJukus="";
        String navFileNames=restaurant.getNavPic();
        String[] navFileName=new String[3];
        String array[]=navFileNames.split(",");
        if(array.length<3){
        for(int k=0;k<array.length;k++)
        {
            navFileName[k]=array[k];

        }}
        else{
            navFileName=array;
        }
        for(int i=0;i<3;i++)
        {
            String navShuJuku="";
            MultipartFile navFile=pictureFile2[i];
            if(StringUtils.isNoneBlank(navFile.getOriginalFilename()))
            {
                navShuJuku=jSchUtil.uploadFile(navFile)+",";
            }else
            {
                if(StringUtils.isNoneBlank(navFileName[i])){
                navShuJuku=navFileName[i]+",";
                }
            }
            navShuJukus=navShuJukus+navShuJuku;

        }
        navShuJukus=navShuJukus.substring(0,navShuJukus.length()-1);
        restaurant.setNavPic(navShuJukus);
        restaurantService.update(restaurant);
        return "/mainFrame/restaurantManager/successOfResManager.jsp" ;






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
    public String deleteALL(HttpServletResponse response,Integer[] ids) throws IOException {

        //System.out.println(queryPojo.getItem().getId());
        //System.out.println(queryPojo.getItem().getName());
        //System.out.println(queryPojo.getIds().length);
        for(int id:ids){
            restaurantService.deleteRestaurant(id);
        }
        return "/mainFrame/restaurantManager/successOfResManager.jsp";


    }
    //根据是否存在userid跳转到添加页面
    @RequestMapping("/addFilter")
    public String addFilter(Integer uId, Model model)
    {

        if(uId==0)
        {
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
