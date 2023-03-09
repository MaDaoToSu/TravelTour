using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using travelH2tour.Models;

namespace travelH2tour.Controllers
{
	public class KhachHangController : Controller
	{
		dbTravelTourDataContext data = new dbTravelTourDataContext();
		// GET: KhachHang

		public List<CT_TOUR> getDanhGia(int count)
		{
			return data.CT_TOURs.Select(p => p).Take(count).ToList();
		}
		public ActionResult DanhGiaCuaKhachHang()
		{
			var Danhgia = getDanhGia(4);
			return PartialView(Danhgia);
		}
	}
}