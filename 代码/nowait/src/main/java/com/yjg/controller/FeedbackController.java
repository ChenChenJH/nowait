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
	 * 获取所有的微信用户反馈
	 * @return List<Feedback>
	 */
	@RequestMapping("getAllFeedback")
	public String getAllFeedback(ModelMap modelMap){
		
		List<Feedback> feedbacks;
		feedbacks = feedbackService.getAllFeedback();
		modelMap.addAttribute("feedbacks", feedbacks);	
		return "/mainFrame/feedbackManager/feedbackList.jsp";
		
	}
	
	/**
     * 获取所有未读的微信用户反馈
     * @return List<Feedback>
     */
    @RequestMapping("getAllFeedbackByIsRead")
    public String getAllFeedbackByIsRead(ModelMap modelMap){
        
        List<Feedback> feedbacks;
        feedbacks = feedbackService.getAllFeedbackByIsRead();
        modelMap.addAttribute("feedbacks", feedbacks);  
        return "/mainFrame/feedbackManager/feedbackList.jsp";
        
    }
	
	/**
	 * 根据微信用户id段获取的用户反馈
	 * @param wxuserId
	 * @return List<Feedback>
	 */
	@RequestMapping("getFeedbackById")
	public String getFeedbackById(ModelMap modelMap,@RequestParam("id") int id){
		
	    //读取单条用户反馈，把该反馈置为已读
	    feedbackService.updateFeedbackIsReadById(id, "已讀");
		Feedback feedback = feedbackService.getFeedbackById(id);
		modelMap.addAttribute("feedback", feedback);	
		return "/mainFrame/feedbackManager/feedbackDetail.jsp";
		
	}
	
	/**
     * 根据id修改用户反馈读写状态
     * @param id
     * @param idRead
	 * @throws UnsupportedEncodingException 
     */
	@RequestMapping("updateFeedbackIsReadById")
	public String updateFeedbackIsReadById(ModelMap modelMap,@RequestParam("id") int id,@RequestParam("check") String isRead) throws UnsupportedEncodingException{
	    
	    if("option1".equals(isRead)){
	        isRead = "未讀";
	    }else{
	        isRead = "已讀";
	    }
        feedbackService.updateFeedbackIsReadById(id, isRead);
        return "/mainFrame/feedbackManager/successOfManager.jsp";
        
    }
	
	/**
	 * 把全部未读用户反馈标为已读
	 */
	@RequestMapping("updateFeedbackIsRead")
	public String updateFeedbackIsRead(ModelMap modelMap){
	    
	    feedbackService.updateFeedbackIsRead();
	    return "/mainFrame/feedbackManager/successOfManager.jsp";
	}
	
	/**
     * 根据id把用户反馈删除
     * @param id
     */
	@RequestMapping("deleteFeedbackById")
	public String deleteFeedbackById(ModelMap modelMap,@RequestParam("id") int id){

	    feedbackService.deleteFeedbackById(id);
	    return "/mainFrame/feedbackManager/successOfManager.jsp";
	    
	}
	
	/**
     * 根据多个id删除多个对应的用户反馈
     * @param id
     */
    @RequestMapping("deleteFeedbackByIds")
    public String deleteFeedbackByIds(ModelMap modelMap,@RequestParam("checkBox") int[] id){

        feedbackService.deleteFeedbackByIds(id);
        return "/mainFrame/feedbackManager/successOfManager.jsp";
        
    }
}
