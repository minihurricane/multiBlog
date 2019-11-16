package pers.wsf.multiBlog.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.wsf.multiBlog.mapper.ArticleMapper;
import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.AxisArticle;
import pers.wsf.multiBlog.service.AxisArticleService;
import pers.wsf.multiBlog.utils.ArticleUtils;
@Service
public class AxisArticleServiceImpl implements AxisArticleService{

	@Autowired
	ArticleMapper articleMapper;
	
	Logger log=Logger.getLogger(AxisArticleServiceImpl.class.getName());
	
	@Override
	public List<AxisArticle> getAxisList() {
				ArticleUtils articleUtils=new ArticleUtils();
		// ��ȡ���ݿ��е���������
				List<Article> articles =this.getAllArticle();
				log.debug("ArticleServiceImpl其中一个getTitle："+articles.get(0).getTitle()+"\n");
				// ������ ʱ�������� (һ�ֱ�Article��������õĶ���)
				List<AxisArticle> axis_list = new ArrayList();
				// Article->AxisArticle
				for (Article a : articles) {
					AxisArticle at = articleUtils.getAxisArticle(a);
					axis_list.add(at);
				}
				
				log.debug("ArticleService���axis_list��"+axis_list+"\n");
				
				AxisArticle tmp = null;
				List result = new LinkedList();
				// ����ȥ���µ�һ����� ���������һ��AxisArticle
				if (!axis_list.isEmpty()) {
					tmp = new AxisArticle();
					tmp.setId(0);
					tmp.setYear(axis_list.get(0).getYear());
					result.add(tmp);
					result.add(axis_list.get(0));
				}
				log.debug("!axis_list.isEmpty()"+result+"\n");
				// �ж���������ǲ��ǲ�һ�� ��һ������һ��year
				for (int i = 1; i < axis_list.size(); i++) {
					int present_year = axis_list.get(i).getYear();
					int past_year = axis_list.get(i - 1).getYear();

					if (present_year < past_year) {
						tmp = new AxisArticle();
						tmp.setId(0);
						tmp.setYear(present_year);
						result.add(tmp);
					}
					result.add(axis_list.get(i));
				}
				// ע��: ��list�������涯̬�޸������鳤�Ȼ�����ڴ���������
				log.debug("ArticleServiceImpl的result: "+result);
				return result;				
	}

	/* �Ի�ȡ��������Article�������� */
	public List<Article> getAllArticle(){
		List<Article> list=articleMapper.getAllArticle();
		Collections.sort(list);//Collection.sort(); 是以单表对象来排序？ 而不是多表联结对象？？？
		return list;
	}
}
