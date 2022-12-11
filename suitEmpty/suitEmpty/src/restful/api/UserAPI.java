package restful.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.springframework.beans.factory.annotation.Autowired;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.Clothes;
import restful.entity.User;

@Path("user")
public class UserAPI {
//	@Autowired
//	private HttpServletRequest request;
	
	// 账号注册
	@POST
	@Path("/signUp")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signUp(User user) {
		// 后台API必须进行合法性校验后才能存入数据库
		
		// 寻找相同的用户名称
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.signUp",User.class)
				.setParameter("username","%"+user.getUsername()+"%")
				.getResultList();
		
		System.out.println(result);
		
		if(result.isEmpty()) {
			// 存入数据库,错误会服务器故障
			user.setId(0);
			user = EM.getEntityManager().merge(user);
			EM.getEntityManager().persist(user);
			EM.getEntityManager().getTransaction().commit();
			
			// 向客户端返回JSON格式的Result对象结果
			return new Result(0, "注册成功", user, "");
		}else {
			// 数据库存在相同用户名称
			return new Result(-1,"注册失败，存在相同的用户名称", user, "");
		}
		
		
	}
	
	
	
	// 账号登录
	@POST
	@Path("/signIn")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signIn(@Context HttpServletRequest request,User user) {
		
		// 数据库获取
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.signIn", User.class)
				.setParameter("username","%"+user.getUsername()+"%")
				.setParameter("password","%"+user.getPassword()+"%")
				.getResultList();
		
		// 是否获取
		if(result.isEmpty()) {
			// 未找到
			return new Result(-1, "登录失败，名称或密码错误", user, "");
		}else {
			// 找到
			request.getSession().setAttribute("user", result);
			
//			System.out.println("---------------");
	
			return new Result(0, "登录成功", result, "");
		}
	
		
	}
	
	
	// 个人账号管理
	
	// 展示个人信息
	@POST
	@Path("/Pinformation")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result information(@Context HttpServletRequest request,User user) {
		
		// 刷新页面数据，数据库
		List<User> result = (List<User>) request.getSession().getAttribute("user");
		
		
		return new Result(0, "登录成功", result, "");
	}
	
	
	
	
	
	// 修改个人信息
	@POST
	@Path("/update")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result update(@Context HttpServletRequest request,User user) {
		// 冲突
		
		
		// 信息修改
		EM.getEntityManager().persist(EM.getEntityManager().merge(user));
		EM.getEntityManager().getTransaction().commit();
		
		// session数据修改,服务器故障？？？？？？？？？？
		/// request.getSession().setAttribute("user", user);
		
		return new Result(0, "用户信息修改成功", user, "");
	}
	
	// 用户管理
	
	// 展示用户管理
	@POST
	@Path("/userManage")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result userManage() {
		// 用户权限
		
		
		// 刷新页面数据，数据库
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.findAll", User.class)
				.getResultList();
		
		
		return new Result(0, "用户管理信息查询成功", result, "");
	}
	
	// 修改用户管理
	@POST
	@Path("/updateUserManage")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result updateUserManage() {
		
		
		
		return new Result(0, "登录成功", "shj", "");
	}
	
	
	
	
	// 删除
	@POST
	@Path("/deleteUserManage")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result deleteUserManage(User user) {
		
		EM.getEntityManager().remove(EM.getEntityManager().merge(user));
		EM.getEntityManager().getTransaction().commit();
		
		return new Result(0,"成功删除用户",user,"");
	}
	
	
	// 服饰类别管理
	
	// 展示服饰类别
	@POST
	@Path("/showClothes")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result showClothes() {
		// 用户权限
		
		
		
		// 数据库查询所有服饰类别
		List<Clothes> result = EM.getEntityManager()
				.createNamedQuery("Clothes.findAll", Clothes.class)
				.getResultList();
		
		
		return new Result(0,"服饰类别查询成功",result,"");
	}
	
	// 添加服饰类别
	@POST
	@Path("/addClothes")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result addClothes(Clothes clothes) {
		
		// 主键冲突
		List<Clothes> result = EM.getEntityManager()
				.createNamedQuery("Clothes.findByCode", Clothes.class)
				.setParameter("code", "%"+clothes.getCode()+"%")
				.getResultList();
				
		if(result.isEmpty()) {
			// 添加
			clothes.setId(0);
			clothes = EM.getEntityManager().merge(clothes);
			EM.getEntityManager().persist(clothes);
			EM.getEntityManager().getTransaction().commit();
			
			return new Result(0,"成功添加服饰类别",clothes,"");
		}else{
			return new Result(-1,"添加失败，存在相同编号的服饰类别",clothes,"");
		}
		
		
		
	}
	
	// 修改服饰类别
	@POST
	@Path("/updateClothes")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result updateClothes(Clothes clothes) {
		
		// 主键冲突
		List<Clothes> result = EM.getEntityManager()
				.createNamedQuery("Clothes.findByCode", Clothes.class)
				.setParameter("code", "%"+clothes.getCode()+"%")
				.getResultList();
		
		
		// 修改服饰类别
		if(result.isEmpty()) {
			EM.getEntityManager().persist(EM.getEntityManager().merge(clothes));
			EM.getEntityManager().getTransaction().commit();
			
			return new Result(0,"成功修改服饰类别",clothes,"");
		}else {
			
			return new Result(-1,"修改失败，服饰类别编号存在相同",clothes,"");
		}
		
		
	}

	// 删除服饰类别
	@POST
	@Path("/deleteClothes")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result deleteClothes(Clothes clothes) {
		
		EM.getEntityManager().remove(EM.getEntityManager().merge(clothes));
		EM.getEntityManager().getTransaction().commit();
		
		return new Result(0,"成功删除服饰类别",clothes,"");
	}
	
}
