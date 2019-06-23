package fr.adaming.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IRoleDao;
import fr.adaming.model.Role;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService  {
	
		IRoleDao rDao;

		@Autowired
		public void setDao(IRoleDao daoToSet) {
			rDao = daoToSet;
			rDao.setClazz(Role.class);
		}

		@Override
		public int addRole(Role r) {
			return rDao.create(r);
		}
}
