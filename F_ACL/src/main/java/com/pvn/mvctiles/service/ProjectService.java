package com.pvn.mvctiles.service;

import java.util.List;

import com.pvn.mvctiles.model.Project;
import com.pvn.mvctiles.vo.ProjectVO;

public interface ProjectService
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
	public List<ProjectVO> listProject();
}
