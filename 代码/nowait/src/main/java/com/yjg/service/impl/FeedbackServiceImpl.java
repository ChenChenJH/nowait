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
	 * 根據起始行獲取7條微信用戶反饋
     * @param row 起始行
	 * @return List<Feedback>
	 */
	public List<Feedback> getAllFeedback(int row) throws Exception{
		// TODO Auto-generated method stub
		return feedbackMapper.selectAllFeedback(row);
	}
	
	/**
     * 獲取用戶反饋數量
     * @return int
     */
    public int getAllFeedbackCount() throws Exception{
        // TODO Auto-generated method stub
	    int num = 0;
	    try{
            num = feedbackMapper.selectAllFeedbackCount();
        }catch(Exception e){
            //查询为空
        }
        return num;
    }
	
	/**
     * 根據起始行和讀寫狀態獲取7條微信用戶反饋
     * @param row 起始行
     * @param isRead 讀寫狀態
     * @return List<Feedback>
     */
    public List<Feedback> getAllFeedbackByIsRead(int row, String isRead) throws Exception{
        // TODO Auto-generated method stub
        return feedbackMapper.selectAllFeedbackByIsRead(row,isRead);
    }
    
    /**
     * 根據讀寫狀態獲取用戶數量
     * @param isRead 讀寫狀態
     * @return int
     */
    public int getAllFeedbackCountByIsRead(String isRead) throws Exception{
        // TODO Auto-generated method stub
        int num = 0;
        try{
            num = feedbackMapper.selectAllFeedbackCountByIsRead(isRead);
        }catch(Exception e){
            //查询为空
        }
        return num;
    }

	/**
	 * 根據id獲取用戶反饋
	 * @param id
	 * @return List<Feedback>
	 */
	public Feedback getFeedbackById(int id) throws Exception{
		// TODO Auto-generated method stub
		return feedbackMapper.selectFeedbackById(id);
	}	

	/**
     * 根據id修改用戶反饋讀寫狀態
     * @param id
     * @param isRead
     */
    public void updateFeedbackIsReadById(int id,String isRead) throws Exception{
        // TODO Auto-generated method stub
        feedbackMapper.updateFeedbackIsReadById(id,isRead);
    }

    /**
     * 把全部未讀用戶反饋標為已讀
     */
    public void updateFeedbackIsRead() throws Exception{
        // TODO Auto-generated method stub
        feedbackMapper.updateFeedbackIsRead();
    }
    
    /**
     * 根據id刪除用戶反饋
     * @param id
     */
    public void deleteFeedbackById(int id) throws Exception{
        // TODO Auto-generated method stub
        feedbackMapper.deleteFeedbackById(id);
    }
    
    /**
     * 根據多個id刪除多個對應的用戶反饋
     * @param id 
     */
    public void deleteFeedbackByIds(@Param("id") int[] id) throws Exception{
        feedbackMapper.deleteFeedbackByIds(id);
    }


}
