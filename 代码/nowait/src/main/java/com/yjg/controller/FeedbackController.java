package com.yjg.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yjg.entity.Feedback;
import com.yjg.service.FeedbackService;

@Controller
@RequestMapping("feedback")
public class FeedbackController {
	
	@Resource
	private FeedbackService feedbackService;
    
	/**
	 * 根據起始行獲取後面的7條用戶反饋
	 * @return List<Feedback>
	 */
	@RequestMapping("getAllFeedback")
	public String getAllFeedback(ModelMap modelMap, @RequestParam("row") int row) throws Exception{
		
	    //獲取用戶反饋總頁數,7條/頁
	    int num = feedbackService.getAllFeedbackCount();
	    int page = num / 7;
	    if(num%7 != 0){
	        page++;
	    }
		List<Feedback> feedbacks;
		//獲取從第7*(row-1)行起的7條用户反馈
		feedbacks = feedbackService.getAllFeedback(7*(row-1));
		modelMap.addAttribute("feedbacks", feedbacks);
		//當前頁數
		modelMap.addAttribute("row", row);
		//總頁數
		modelMap.addAttribute("page", page);
		return "/mainFrame/feedbackManager/feedbackList.jsp";
		
	}
	
	/**
	 * 根據起始行和讀寫狀態獲取7條微信用戶反饋
     * @return List<Feedback>
     */
    @RequestMapping("getAllFeedbackByIsRead")
    public String getAllFeedbackByIsRead(ModelMap modelMap, @RequestParam("row") int row,
    		@RequestParam("isRead") String isRead) throws Exception{
        
      //獲取用戶反饋總頁數,7條/頁
        int num = feedbackService.getAllFeedbackCountByIsRead(isRead);
        int page = num / 7;
        if(num%7 != 0){
            page++;
        }
        List<Feedback> feedbacks;
        //根據讀寫狀態獲取從第7*(row-1)行起的7條用户反馈
        feedbacks = feedbackService.getAllFeedbackByIsRead(7*(row-1),isRead);
        modelMap.addAttribute("feedbacks", feedbacks);
        //當前頁
        modelMap.addAttribute("row", row);
        //總頁數
        modelMap.addAttribute("page", page);
        if("已讀".equals(isRead)){
            return "/mainFrame/feedbackManager/feedbackReadList.jsp";
        }else{
            return "/mainFrame/feedbackManager/feedbackUnreadList.jsp";
        }
        
    }
	
	/**
	 * 根據微信用戶id獲取用戶反饋
	 * @param id
	 * @return List<Feedback>
	 */
	@RequestMapping("getFeedbackById")
	public String getFeedbackById(ModelMap modelMap,@RequestParam("id") int id) throws Exception{
		
	    //讀取單條用戶反饋，把該反饋置為已讀
	    feedbackService.updateFeedbackIsReadById(id, "已讀");
		Feedback feedback = feedbackService.getFeedbackById(id);
		modelMap.addAttribute("feedback", feedback);	
		return "/mainFrame/feedbackManager/feedbackDetail.jsp";
		
	}
	
	/**
	 * 根據id修改用戶反饋的讀寫狀態
     * @param id
     * @param idRead
	 * @throws UnsupportedEncodingException 
     */
	@RequestMapping("updateFeedbackIsReadById")
	public String updateFeedbackIsReadById(ModelMap modelMap,@RequestParam("id") int id,
	        @RequestParam("check") String isRead) throws Exception{
	    
	    if("option1".equals(isRead)){
	        isRead = "未讀";
	    }else{
	        isRead = "已讀";
	    }
        feedbackService.updateFeedbackIsReadById(id, isRead);
        return "/mainFrame/feedbackManager/successOfManager.jsp";
        
    }
	
	/**
	 * 全部未讀用戶反饋標為已讀
	 */
	@RequestMapping("updateFeedbackIsRead")
	public String updateFeedbackIsRead(ModelMap modelMap,int row) throws Exception{
	    
	    feedbackService.updateFeedbackIsRead();
	    //刷新當前頁
	    return getAllFeedback(modelMap, row);
	}
	
	/**
	 * 根據id把用戶反饋刪除
     * @param id
     */
	@RequestMapping("deleteFeedbackById")
	public String deleteFeedbackById(ModelMap modelMap,@RequestParam("id") int id,int row) throws Exception{

	    feedbackService.deleteFeedbackById(id);
	    //刷新當前頁
	    return getAllFeedback(modelMap, row);
	    
	}
	
	/**
     * 根據多個id刪除多個對應的用戶反饋
     * @param id
     */
    @RequestMapping("deleteFeedbackByIds")
    public String deleteFeedbackByIds(ModelMap modelMap,@RequestParam("checkBox") int[] id,int row) throws Exception{

        feedbackService.deleteFeedbackByIds(id);
        //刷新當前頁
        return getAllFeedback(modelMap, row);
        
    }
    
    /**
     * 未讀頁面：根據id把用戶反饋刪除
     * @param id
     * @param isRead 讀寫狀態
     */
    @RequestMapping("deleteFeedbackIsReadById")
    public String deleteFeedbackIsReadById(ModelMap modelMap,@RequestParam("id") int id,
    		@RequestParam("isRead") String isRead,int row) throws Exception{

        feedbackService.deleteFeedbackById(id);
        //刷新當前頁
        return getAllFeedbackByIsRead(modelMap, row,isRead);
        
    }
    
    /**
     * 未讀頁面：根據多個id刪除多個對應的用戶反饋
     * @param id 
     * @param isRead 讀寫狀態
     */
    @RequestMapping("deleteFeedbackIsReadByIds")
    public String deleteFeedbackIsReadByIds(ModelMap modelMap,@RequestParam("checkBox") int[] id,
    		@RequestParam("isRead") String isRead,int row) throws Exception{

        feedbackService.deleteFeedbackByIds(id);
        //刷新當前頁
        return getAllFeedbackByIsRead(modelMap, row,isRead);
        
    }
}
