<%@ page contentType="text/html;charset=UTF-8" language="java" %>
           <div id="mainnav">
              <div id="mainnav-hd">
                <h2>导航菜单</h2>
                <a id="sidebar-toggler" href="javascript:;" title="隐藏/显示 导航菜单"><span></span></a>
              </div>
              <div id="navlist-wraper">
                <ul id="navlist" class="nav nav-list">
                  <li class="current hasSub">
                    <a href="javascript:;" data-nbid="1" title="用户管理" class="notExpand">
                      <i class="icon icon-user"></i>
                      <span class="txt">用户管理</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a  href="javascript:;" data-url="<%=basePath%>user/showUserList">
                          <i class="icon icon-circle"></i>
                          <span class="txt">登录信息管理</span>
                        </a>
                      </li>
                      <li>
                        <a  href="javascript:;" data-url="<%=basePath%>group/v_list.do">
                          <i class="icon icon-circle"></i>
                          <span class="txt">角色信息管理</span>
                        </a>
                      </li>
                      <li>
                        <a  href="javascript:;" data-url="">
                          <i class="icon icon-circle"></i>
                          <span class="txt">个人用户管理</span>
                        </a>
                      </li>
                      <li>
                        <a  href="javascript:;" data-url="">
                          <i class="icon icon-circle"></i>
                          <span class="txt">组织机构用户管理</span>
                        </a>
                      </li>
                    </ul>  
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="2" title="基本情况" class="notExpand">
                      <i class="icon icon-sitemap"></i>
                      <span class="txt">基本情况</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="<%=basePath%>info/intro_e.do?cate=info">
                          <i class="icon icon-circle"></i>
                          <span class="txt">中心概况</span>
                        </a>
                      </li>
                      
                      <li>
                        <a href="javascript:;" data-url="<%=basePath%>info/intro_e.do?cate=org">
                          <i class="icon icon-circle"></i>
                          <span class="txt">组织架构</span>
                        </a>
                      </li>
                      
                      <li>
                        <a href="javascript:;" data-url="<%=basePath%>info/intro_e.do?cate=contact">
                          <i class="icon icon-circle"></i>
                          <span class="txt">联系我们</span>
                        </a>
                      </li>
                      
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="3" title="信息发布" class="notExpand">
                      <i class="icon icon-list-alt"></i>
                      <span class="txt">信息服务</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="<%=basePath%>info/info_s">
                          <i class="icon icon-circle"></i>
                          <span class="txt">信息管理</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="4" title="模板" class="notExpand">
                      <i class="icon icon-tasks"></i>
                      <span class="txt">模板</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="模板管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">模板管理</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="5" title="资源" class="notExpand">
                      <i class="icon icon-inbox"></i>
                      <span class="txt">资源</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="资源管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">资源管理</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="6" title="辅助" class="notExpand">
                      <i class="icon icon-group"></i>
                      <span class="txt">辅助</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="评论管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">评论管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="投票管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">投票管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="留言管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">留言管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="留言类别.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">留言类别</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="广告管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">广告管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="广告版位.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">广告版位</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="友情链接管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">友情链接管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="友情链接类别.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">友情链接类别</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="7" title="维护" class="notExpand">
                      <i class="icon icon-legal"></i>
                      <span class="txt">维护</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="专题管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">专题管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="TAG管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">TAG管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="关键词管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">关键词管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="敏感词管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">敏感词管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="内容回收站.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">内容回收站</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="8" title="消息提醒" class="notExpand">
                      <i class="icon icon-comment"></i>
                      <span class="txt">消息提醒</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="消息提醒.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">消息提醒</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="9" title="生成" class="notExpand">
                      <i class="icon icon-archive"></i>
                      <span class="txt">生成</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="<%=basePath%>info/static_m">
                          <i class="icon icon-circle"></i>
                          <span class="txt">首页静态化</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="栏目页静态化.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">栏目页静态化</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="内容页静态化.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">内容页静态化</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="全文检索.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">全文检索</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="hasSub">
                    <a href="javascript:;" data-nbid="10" title="配置" class="notExpand">
                      <i class="icon icon-gear"></i>
                      <span class="txt">配置</span>
                      <span class="more"><i class="icon-caret-down"></i></span>
                    </a>
                    <ul class="sub-nav">
                      <li>
                        <a href="javascript:;" data-url="全局设置.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">全局设置</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="站点设置.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">站点设置</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="模型管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">模型管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="内容类型.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">内容类型</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="FTP管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">FTP管理</span>
                        </a>
                      </li>
                      <li>
                        <a href="javascript:;" data-url="站点管理.html">
                          <i class="icon icon-circle"></i>
                          <span class="txt">站点管理</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                </ul><!-- /.nav-list -->
              </div>
              <div id="nav-list-pan" class="fn-usn"></div>
            </div><!-- /.mainnav -->