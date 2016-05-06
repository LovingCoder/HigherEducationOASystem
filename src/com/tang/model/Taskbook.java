package com.tang.model;
import com.google.common.base.Strings;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.tang.bean.PageInfo;
import com.tang.bean.RequestBean;
import com.tang.config.OAConfig;
import com.tang.entity.TaskBookExcel;
import com.tang.model.base.BaseTaskbook;
import com.tang.util.DateUtils;
import com.tang.util.IDKit;
import com.tang.util.ParamKit;
import com.tang.util.SysConstant;
import org.apache.xmlbeans.impl.tool.Extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Taskbook extends BaseTaskbook<Taskbook> {
	public static final Taskbook dao = new Taskbook();

	/**
	 * 导入任务书
	 * @param list
	 * @return
	 * @throws Exception
	 */
	@Before(Tx.class)
	public Boolean importTaskbook(List<TaskBookExcel> list,String term) throws Exception{
		Record record;
		Boolean result = false;
		for (TaskBookExcel taskBookExcel:list){
			record = new Record();
			record.set("id", IDKit.uuid())
					.set("isDelete", SysConstant.ISDELETE.NO)
					.set("createTime", DateUtils.getCurrentDate())
					.set("updateTime",DateUtils.getCurrentDate())
					.set("serialNumber",Strings.isNullOrEmpty(taskBookExcel.getSerialNumber()) ? null : taskBookExcel.getSerialNumber())
					.set("courseCode",Strings.isNullOrEmpty(taskBookExcel.getCourseCode()) ? null : taskBookExcel.getCourseCode())
					.set("courseName",Strings.isNullOrEmpty(taskBookExcel.getCourseName()) ? null : taskBookExcel.getCourseName())
					.set("teachingNumber",Strings.isNullOrEmpty(taskBookExcel.getTeachingNumber()) ? null : taskBookExcel.getTeachingNumber())
					.set("major",Strings.isNullOrEmpty(taskBookExcel.getMajor()) ? null : taskBookExcel.getMajor())
					.set("schoolZone",Strings.isNullOrEmpty(taskBookExcel.getSchoolZone()) ? null : taskBookExcel.getSchoolZone())
					.set("classAndStudent",Strings.isNullOrEmpty(taskBookExcel.getClassAndStudent()) ? null : taskBookExcel.getClassAndStudent())
					.set("grade",Strings.isNullOrEmpty(taskBookExcel.getGrade()) ? null : taskBookExcel.getGrade())
					.set("totalStudent",Integer.valueOf(taskBookExcel.getTotalStudent()))
					.set("testType",Strings.isNullOrEmpty(taskBookExcel.getTestType()) ? null : taskBookExcel.getTestType())
					.set("weekTime",Strings.isNullOrEmpty(taskBookExcel.getWeekTime()) ? null : taskBookExcel.getWeekTime())
					.set("totalTime",Integer.valueOf(taskBookExcel.getTotalTime()))
					.set("startAndEndWeek",Strings.isNullOrEmpty(taskBookExcel.getStartAndEndWeek()) ? null : taskBookExcel.getStartAndEndWeek())
					.set("classHour",Integer.valueOf(taskBookExcel.getClassHour()))
					.set("teacherSign",Strings.isNullOrEmpty(taskBookExcel.getTeacherSign()) ? null : taskBookExcel.getTeacherSign())
					.set("title",Strings.isNullOrEmpty(taskBookExcel.getTitle()) ? null : taskBookExcel.getTitle())
					.set("courseProperty",Strings.isNullOrEmpty(taskBookExcel.getCourseProperty()) ? null : taskBookExcel.getCourseProperty())
					.set("mergeClassOpinion",Strings.isNullOrEmpty(taskBookExcel.getMergeClassOpinion()) ? null : taskBookExcel.getMergeClassOpinion())
					.set("classRoomType",Strings.isNullOrEmpty(taskBookExcel.getClassRoomType()) ? null : taskBookExcel.getClassRoomType())
					.set("term", term);
			result = Db.save("taskbook",record);
			if (!result){
				throw new Exception("导入任务书失败！");
			}
		}
		return result;
	}

	/**
	 * 获取任务书列表
	 * @param requestBean
	 * @return
	 */
	public Page<Record> taskbookList(RequestBean requestBean){
		String term = ParamKit.checkObjectNotNull(requestBean,"term");
		String courseName = ParamKit.checkObjectNotNull(requestBean, "courseName");
		String major = ParamKit.checkObjectNotNull(requestBean, "major");
		String courseProperty = ParamKit.checkObjectNotNull(requestBean,"courseProperty");
		String select = "SELECT *";
		StringBuilder sqlExcept = new StringBuilder("FROM taskbook WHERE isDelete = ?");
		List<Object> paras = new ArrayList<Object>();
		paras.add(SysConstant.ISDELETE.NO);
		if (!Strings.isNullOrEmpty(courseName)){
			sqlExcept.append(" AND courseName LIKE ? ");
			paras.add("%" + courseName +"%");
		}
		if (!Strings.isNullOrEmpty(courseProperty)){
			sqlExcept.append(" AND courseProperty LIKE ? ");
			paras.add("%" + courseProperty +"%");
		}
		if (!Strings.isNullOrEmpty(major)){
			sqlExcept.append(" AND major LIKE ? ");
			paras.add("%" + major +"%");
		}
		if (!Strings.isNullOrEmpty(term)){
			sqlExcept.append(" AND term LIKE ? ");
			paras.add("%"+term+"%");
		}
		sqlExcept.append(" ORDER BY serialNumber ASC ");
		Page<Record> recordPage = Db.paginate(requestBean.getPageInfo().getCurrentPage(), requestBean.getPageInfo().getPageSize(), select, sqlExcept.toString(), paras.toArray());
		return recordPage;
	}

	/**
	 * 获取没有被教师选的任务书 课程
	 * @param requestBean
	 * @return
	 */
	public Page<Record> getNotChoosenTaskbook(RequestBean requestBean){
		String schoolId = ParamKit.checkObjectNotNull(requestBean,"schoolId");
		String collegeId = ParamKit.checkObjectNotNull(requestBean,"collegeId");

		String term = ParamKit.checkObjectNotNull(requestBean,"term");
		String courseName = ParamKit.checkObjectNotNull(requestBean, "courseName");
		String major = ParamKit.checkObjectNotNull(requestBean, "major");
		String courseProperty = ParamKit.checkObjectNotNull(requestBean,"courseProperty");

		int pageNumber = requestBean.getPageInfo().getCurrentPage();
		int pageSize = requestBean.getPageInfo().getPageSize();

		List<Object> paras = new ArrayList<Object>();

		String select = "SELECT *";
		StringBuilder sqlExcept = new StringBuilder("FROM taskbook " +
				"WHERE id NOT IN(SELECT teacher_taskbook.taskbookId FROM teacher_taskbook " +
				"WHERE teacher_taskbook.teacherId IN(SELECT teacher.id FROM teacher " +
				"WHERE teacher.schoolId = ? AND collegeId = ? AND isDelete = ?) AND teacher_taskbook.isDelete = ?) " +
				"AND taskbook.isDelete = ?");
		paras.add(schoolId);
		paras.add(collegeId);
		paras.add(SysConstant.ISDELETE.NO);
		paras.add(SysConstant.ISDELETE.NO);
		paras.add(SysConstant.ISDELETE.NO);
		if (!Strings.isNullOrEmpty(courseName)){
			sqlExcept.append(" AND courseName LIKE ? ");
			paras.add("%" + courseName +"%");
		}
		if (!Strings.isNullOrEmpty(courseProperty)){
			sqlExcept.append(" AND courseProperty LIKE ? ");
			paras.add("%" + courseProperty +"%");
		}
		if (!Strings.isNullOrEmpty(major)){
			sqlExcept.append(" AND major LIKE ? ");
			paras.add("%" + major +"%");
		}
		if (!Strings.isNullOrEmpty(term)){
			sqlExcept.append(" AND term LIKE ? ");
			paras.add("%"+term+"%");
		}
		sqlExcept.append(" ORDER BY serialNumber ASC ");
		Page<Record> recordPage = Db.paginate(pageNumber,pageSize,select,sqlExcept.toString(),paras.toArray());
		return recordPage;
	}

	/**
	 * 检查该任务书 课程是否已经被其他教师选定
	 * @param requestBean
	 * @return
	 */
	public Record checkTaskbookIsChoosen(RequestBean requestBean){
		String taskbookId = ParamKit.checkObjectNotNull(requestBean,"taskbookId");
		String sql = "SELECT taskbook.*,teacher.teacherName FROM teacher_taskbook " +
				"LEFT JOIN teacher ON teacher.id = teacher_taskbook.teacherId " +
				"LEFT JOIN taskbook ON taskbook.id = teacher_taskbook.taskbookId " +
				"WHERE teacher_taskbook.taskbookId = ? AND teacher_taskbook.isDelete = ? AND teacher.isDelete = ? AND taskbook.isDelete = ?";
		return Db.findFirst(sql,taskbookId,SysConstant.ISDELETE.NO,SysConstant.ISDELETE.NO,SysConstant.ISDELETE.NO);
	}

	/**
	 * 根据id获取任务书 课程
	 * @param requestBean
	 * @return
	 */
	public Record getTaskbookById(RequestBean requestBean){
		String taskbookId = ParamKit.checkObjectNotNull(requestBean,"taskbookId");
		return Db.findFirst("SELECT * FROM taskbook WHERE id = ? AND isDelete = ?",taskbookId,SysConstant.ISDELETE.NO);
	}
}
