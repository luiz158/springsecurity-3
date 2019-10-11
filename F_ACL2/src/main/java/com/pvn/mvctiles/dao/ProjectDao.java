package com.pvn.mvctiles.dao;

import java.util.List;

import org.springframework.security.access.prepost.PostFilter;

import com.pvn.mvctiles.model.Project;
import com.pvn.mvctiles.vo.ProjectVO;

public interface ProjectDao
{
	
	/**
	 * @param project
	 */
	public void addProject(Project project);
	
	/**
	 * @param project
	 */
	public void modifyProject(Project project);
	
	/**
	 * @param projectId
	 * @return
	 */
	public ProjectVO getProject(int projectId);
	
	/**
	 * @return
	 */
	@PostFilter("hasPermission(filterObject, 'READ')")
	public List<ProjectVO> listProject();
}
