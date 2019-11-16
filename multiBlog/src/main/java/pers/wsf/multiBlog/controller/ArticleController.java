package pers.wsf.multiBlog.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.service.CommentService;
import pers.wsf.multiBlog.service.TagService;
import pers.wsf.multiBlog.service.impl.ArticleServiceImpl;

@Controller
public class ArticleController {

	@Autowired
	ArticleService articleService;
	@Autowired
	TagService tagService;
	@Autowired
	CommentService commentService;
	
	Logger log=Logger.getLogger(ArticleController.class.getName());
	
	@RequestMapping("Article.action")
	public  ModelAndView Article(HttpServletRequest request, HttpServletResponse response) {
		/** Blog-master/Article?id=${article.id}: ǰ���ã����θ���ˣ����˿�����request����ȡֵ */
		int article_id =Integer.parseInt(request.getParameter("id"));		
		Article oneArticle=articleService.getArticleAndSort(article_id);
		//getTagByIdҪ���ص���Tag��������List
		request.setAttribute("article_tags", tagService.getTagById(article_id));	//���µ����б�ǩ(��ʵֻ��һ��);�������µı�ǩ��ǰ����ͼ
		// ��ȡ��һƪ����
		request.setAttribute("article_pre", articleService.getPreviousArticle(oneArticle.getTime()));
		// ��ȡ��һƪ����
		request.setAttribute("article_next", articleService.getNextArticle(oneArticle.getTime()));
		//��ȡ����
		request.setAttribute("user_comment_map",commentService.getAllComment(article_id));
		
		ModelAndView mav=new ModelAndView();

		mav.addObject("article",oneArticle);
		mav.setViewName("article");
		return mav;

	}
	@RequestMapping("getOneArticleByTitle.action")
	public ModelAndView getOneArticleByTitle(HttpServletRequest request,String title) {
		Article article=articleService.getCreatedArticle(title);
		request.setAttribute("article_tags", tagService.getTagById(article.getArticle_id()));
		ModelAndView mav=new ModelAndView();
		mav.addObject("article",article);
		mav.setViewName("article");

		return mav;
	}

	/* ��Ӳ���
	 * addArticle��˿�������Ҫ����addArticle��ͼ��ʾ�����ݴ���ȥ ����д�������£�
	 * */

	@RequestMapping("addArticle.action")
	public ModelAndView addArticle(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		// ��ʼ��ʱ��
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		/* reqest��˸�ֵ��ǰ��ȡֵ */
		request.setAttribute("time", df.format(date));
		// ��ȡ����
		ArticleService as =new ArticleServiceImpl();
		
		mav.setViewName("addArticle");
		return mav;
	}

	/* ���������� */
	@RequestMapping("userManageArticle.action")
	public ModelAndView userManageArticle(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		int user_id=Integer.parseInt(request.getParameter("get"));
		//添加一个管理员与普通用户的判断，普通用户与管理员跳转的页面不同（根据用户id来判断是否为管理员，然后跳转不同的后端处理，反馈给不同的前端）
		if(user_id==7) {
			request.setAttribute("user_article_map", articleService.getUserAndArticle());
			articleService.listAllArticle();
			mav.setViewName("adminManageArticle");
		}
		if(user_id!=7) {
			List<Article> articles=articleService.getUserArticle(user_id);
			if(articles.size()>=1) {
			log.debug("articles里的的user："+articles.get(1).getUser().getUsername());
			}
			mav.addObject("articles",articles);
			mav.setViewName("userManageArticle");
		}					
		return mav;
	}

	/* ��������
	 * createArticle��˿����������û����격�����º󣬴������� 
	 * */
	@RequestMapping(value="createArticle.action",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public ModelAndView createArticle_POST(String author,String title,String sort,String time,String content,String tags) {
		ModelAndView mav=new ModelAndView();
		log.debug("ArticleController的createArticle.action的author："+author);
		log.debug("createArticle_POST的sort："+sort);
		Article article=articleService.createArticle(author,title,sort,time,content);

		tagService.addTag(article.getArticle_id(), tags);
		/* �������ߡ������������µ�id */
	
		mav.addObject("article",article);
		mav.setViewName("articleCreated");
		return mav;
	}

	@RequestMapping(value="createArticle.action",method=RequestMethod.GET,produces = "text/html;charset=UTF-8")
	public ModelAndView createArticle_GET(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("articleCreated");
		return mav;
	}

	@RequestMapping(value="updateArticle.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public ModelAndView updateArticle_POST(Integer article_id,String author,String title,String sort,String time,String content,String tag) {
		ModelAndView mav=new ModelAndView();
		Article article=null;
		article=articleService.updateArticle(article_id,author,title,sort,time,content,tag);

		tagService.updateTag(article_id, tag);
		//对更改结果进行判断，更改成功则 跳到更改成功界面 ，点击查看 ，再跳到相应的界面
		
		mav.addObject("article",article);		
		mav.setViewName("articleUpdated");
		return mav;
	}
	
	@RequestMapping(value="updateArticle.action",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public ModelAndView updateArticle_GET(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("articleCreated");
		return mav;
	}
	
	@RequestMapping("userDeleteArticle.action")
	public  ModelAndView userDeleteArticle(int id) {
		articleService.deleteArticle(id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/userManageArticle.action");
	
		return mav;

	}
	
	@RequestMapping("adminDeleteArticle.action")
	public  ModelAndView adminDeleteArticle(int id) {
		articleService.deleteArticle(id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/userManageArticle.action");
		/* mav.setViewName("redirect:/adminManageArticle.action"); */
		return mav;

	}
	@RequestMapping("listArticle.action")
	public  ModelAndView listArticle() {
		ModelAndView mav=new ModelAndView();
		List<Article> cs=articleService.listAllArticle();
		mav.addObject("cs",cs);

		mav.setViewName("");
		return mav;		
	}

	@RequestMapping("getOneCreatedArticleById.action")
	public  ModelAndView getOneCreatedArticleById(HttpServletRequest request,int id) {
		System.out.println("��������idֵ��"+id);

		ModelAndView mav=new ModelAndView();
		Article article=articleService.getOneArticle(id);

		request.setAttribute("article_tags", tagService.getTagById(id));
		mav.addObject("article",article);

		mav.setViewName("article");
		return mav;

	}
	
	/**
	 * 方法描述：<!-- 按照title进行搜索，建立title索引 -->
		<!-- 搜索到文章后，跳转到新页面 来显示搜索到的内容 -->
	 * @param request
	 * @param title
	 * @return
	 */
	@RequestMapping(value="searchArticle.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	public ModelAndView searchArticle(HttpServletRequest request,String title) {
		ModelAndView mav=new ModelAndView();
		List<Article> articles=null;
		articles=articleService.searchArticle(title);
		if(articles.size()<=0) {
			request.setAttribute("showSearchArticle_msg", "啥也搜不到");
		}
		mav.addObject("searchArticles",articles);
		mav.setViewName("showSearchArticle");		
		return mav;
	}
	
	@RequestMapping(value="adminSearchArticle.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	public ModelAndView adminSearchArticle(HttpServletRequest request,String title) {
		ModelAndView mav=new ModelAndView();
		List<Article> articles=null;
		articles=articleService.searchArticle(title);
		if(articles.size()<=0) {
			request.setAttribute("showSearchArticle_msg", "啥也搜不到哈！！！");
		}
		mav.addObject("searchArticles",articles);
		mav.setViewName("adminSearchArticle");		
		return mav;
	}

}
