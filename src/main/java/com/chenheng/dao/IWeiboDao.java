package com.chenheng.dao;

import java.util.List;

import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboCollect;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.bean.WeiboLike;
import com.chenheng.common.bean.WeiboTrans;
import com.chenheng.common.exception.DataAccessException;

public interface IWeiboDao {
	//发布微博
	void publishWeibo(Weibo weibo) throws DataAccessException;
	
	//通过用户id查找微博
	List<Weibo> findWeiboByUserId(long id, int mixPage, int maxPage) throws DataAccessException;
	
	//查询推荐人陌生人
	List<User> findUserByTuijian(long id) throws DataAccessException;
	
	//关注用户
	void attUser(long aId, long bId) throws DataAccessException;
	
	//取消关注用户
	void canUser(long aId, long bId) throws DataAccessException;
	
	//查看用户管制关系
	long findRelation(long aId, long bId) throws DataAccessException;
	
	//查找个人用户微博数量
	int findWeiboNumber(long id)throws DataAccessException;
	
	//查找个人用户微博数量,原创或转发
	int findWeiboNumberAsTransOrMe(long id, int state)throws DataAccessException;
	
	//翻页查找微博
	List<Weibo> paging(long id, int minPage, int maxPage) throws DataAccessException;

	//翻页查找微博。查找转发和原创
	List<Weibo> pagingAsTransOrMe(long id, int minPage, int maxPage, int state) throws DataAccessException;
	
	//查找微博是否已被用户id所点赞
	WeiboLike findweiboLike(long wId, long uId) throws DataAccessException;
	
	//微博点赞
	void likeWeibo(WeiboLike like) throws DataAccessException;
	
	//取消点赞
	void disLikeWeibo(WeiboLike like) throws DataAccessException;
	
	//通过微博id查找发布人id
	long findUserIdbyWId(long wId) throws DataAccessException;
	
	//查找微博点赞数
	int findWeiboLikeNumber(long wId) throws DataAccessException;
	
	//查找微博转发数
	int findWeibotransNumber(long wId) throws DataAccessException;
	
	//通过微博id查找微博
	Weibo findWeiboBywId(long id) throws DataAccessException;
	
	//更新微博信息
	void updateWeibo(Weibo weibo) throws DataAccessException;
	
	//保存微博转发情况
	void saveTrans(WeiboTrans trans) throws DataAccessException;
	
	//保存微博评论 ----
	void saveWeiboComm(WeiboComm comm) throws DataAccessException;
	
	//查找微博评论数目
	int findCommNum(long wId) throws DataAccessException;
	
	//更新微博评论，删除微博评论信息不直接删除，将评论信息的状态设置为 2
	void updateWeiboComm(WeiboComm comm) throws DataAccessException;
	
	//删除微博评论
	void deleteWeiboComm(WeiboComm comm) throws DataAccessException;
	
	//查找评论信息
	List<WeiboComm> findWeiboComm(long wId, long minPage, long maxPage) throws DataAccessException;
	
	//删除微博
	void deleteWeibo(Long wId) throws DataAccessException;
	
	//恢复被删除的微博
	void recoverDeleteWeibo(long w_id) throws DataAccessException;
	
	//清除微博
	void clearWeibo(long wId) throws DataAccessException;
	
	//查找首页微博
	List<Weibo> findWeiboOfHome(int tag, long minPgae, long maxPage, String weiboTime) throws DataAccessException;
	
	//查找state状态的所有微博数量
	int findWeiboOfHomeNum(int state) throws DataAccessException;
	
	//微博收藏功能
	void weiboCollect(WeiboCollect collect) throws DataAccessException;
	
	//查找用户收藏微博
	List<Weibo> findCollectWeibo(long uId, int minPage, int maxPage) throws DataAccessException;
		
	//查找用户收藏微博数
	int findCollectWeiboNum(long uId) throws DataAccessException;
	
	//通过微博内容模糊查询微博
	List<Weibo> findWeiboBySeach(String key, int minPage, int maxPage) throws DataAccessException;
	int findWeiboBySeachNum(String key)throws DataAccessException;
	
	//通过用户昵称模糊查询用户
	List<User> findUserBySeach(String key, int minPage, int maxPage) throws DataAccessException;
	int findUserBySeachNum(String key) throws DataAccessException;
}
