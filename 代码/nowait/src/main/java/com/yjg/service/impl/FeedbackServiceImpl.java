package com.yjg.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.yjg.entity.Feedback;
import com.yjg.mapper.FeedbackMapper;
import com.yjg.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Resource
	private FeedbackMapper feedbackMapper;
	
	/**
	 * 获取所有的微信用户反馈
	 * @return List<Feedback>
	 */
	public List<Feedback> getAllFeedback() {
		// TODO Auto-generated method stub
		return feedbackMapper.selectAllFeedback();
	}
	
	/**
     * 获取所有未读的微信用户反馈
     * @return List<Feedback>
     */
    public List<Feedback> getAllFeedbackByIsRead() {
        // TODO Auto-generated method stub
        return feedbackMapper.selectAllFeedbackByIsRead();
    }

	/**
	 * 根据id段获取的用户反馈
	 * @param id
	 * @return List<Feedback>
	 */
	public Feedback getFeedbackById(int id) {
		// TODO Auto-generated method stub
		return feedbackMapper.selectFeedbackById(id);
	}	

	/**
     * 根据id修改用户反馈读写状态
     * @param id
     * @param isRead
     */
    public void updateFeedbackIsReadById(int id,String isRead) {
        // TODO Auto-generated method stub
        feedbackMapper.updateFeedbackIsReadById(id,isRead);
    }

    /**
     * 把全部未读用户反馈标为已读
     */
    public void updateFeedbackIsRead() {
        // TODO Auto-generated method stub
        feedbackMapper.updateFeedbackIsRead();
    }
    
    /**
     * 根据id把用户反馈删除
     * @param id
     */
    public void deleteFeedbackById(int id) {
        // TODO Auto-generated method stub
        feedbackMapper.deleteFeedbackById(id);
    }
    
    /**
     * 根据多个id删除多个对应的用户反馈
     * @param id 
     */
    public void deleteFeedbackByIds(@Param("id") int[] id){
        feedbackMapper.deleteFeedbackByIds(id);
    }

}
