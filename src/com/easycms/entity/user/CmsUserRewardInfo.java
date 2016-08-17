package com.easycms.entity.user;

import java.io.Serializable;
import java.util.Date;

public class CmsUserRewardInfo implements Serializable {
	private Long reward_id;
	private Long uid;
	private Date reward_time;
	private String reward_content;
	
	public CmsUserRewardInfo(){
		super();
		this.reward_id = 0L;
		this.uid = 0L;
		this.reward_time = new Date();
		this.reward_content = "";
	}

	public Long getReward_id() {
		return reward_id;
	}

	public void setReward_id(Long reward_id) {
		this.reward_id = reward_id;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Date getReward_time() {
		return reward_time;
	}

	public void setReward_time(Date reward_time) {
		this.reward_time = reward_time;
	}

	public String getReward_content() {
		return reward_content;
	}

	public void setReward_content(String reward_content) {
		this.reward_content = reward_content;
	}
}
