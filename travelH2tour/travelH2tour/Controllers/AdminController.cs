using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using travelH2tour.Models;

namespace travelH2tour.Controllers
{
	public class AdminController : Controller
	{
		// GET: Admin
		dbTravelTourDataContext data = new dbTravelTourDataContext();

		public List<BLOG> getBLOGs(int count)
		{
			return data.BLOGs.OrderByDescending(p => p.NGAYDANG).ToList();
		}

		public ActionResult Blog()
		{
			var blog = getBLOGs(3);
			return PartialView(blog);
		}
	}
}