package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;
import com.lec.beans.ToiletWriteDAO;
import com.lec.beans.WriteDAO;

public class WithdrawCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 회원탈퇴, 회원정보 및 회원글삭제
		int result_playground = 0;
		int result_toilet = 0;
		int result_center = 0;
		int result_comment = 0;
		int result_member = 0;
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));

		WriteDAO writedao = new WriteDAO();
		ToiletWriteDAO toiletdao = new ToiletWriteDAO();
		CenterDAO centerdao = new CenterDAO();

		if (mb_uid != 0) {
			try {
				result_playground = writedao.deleteMember(mb_uid);
				result_toilet = toiletdao.deleteMember(mb_uid);
				result_center = centerdao.deleteMember(mb_uid);
				result_comment = centerdao.deleteMemberComment(mb_uid);
				result_member = writedao.deleteMemberInfo(mb_uid);
				request.setAttribute("result_playground", result_playground);
				request.setAttribute("result_toilet", result_toilet);
				request.setAttribute("result_center", result_center);
				request.setAttribute("result_comment", result_comment);
				request.setAttribute("result_member", result_member);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
