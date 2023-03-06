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
		public ActionResult DanhGiaCuaKhachHang()
		{
			var getDanhgia = from danhgia in data.CT_TOURs select danhgia;
			return View(getDanhgia);
		}
	}
}