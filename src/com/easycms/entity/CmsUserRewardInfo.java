package com.easycms.entity;

import java.io.Serializable;
import java.util.Date;

public class CmsUserRewardInfo implements Serializable {
	private Long reward_id;
	private Long uid;
	private Date reward_time;
	private String reward;

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

	public String getReward() {
		return reward;
	}

	public void setReward(String reward) {
		this.reward = reward;
	}
}
