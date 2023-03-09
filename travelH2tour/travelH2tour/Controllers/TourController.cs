using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using travelH2tour.Models;

namespace travelH2tour.Controllers
{
	public class TourController : Controller
	{
		dbTravelTourDataContext data = new dbTravelTourDataContext();
		// GET: Tour
		public List<TOURDL> getTour(int count)
		{
			return data.TOURDLs.OrderByDescending(p => p.TIENTOUR).Take(count).ToList();
		}
		public ActionResult tour()
		{
			var Tour = getTour(6);
			return PartialView(Tour);
		}

		public ActionResult TrangTour()
		{
			var ctTour = data.TOURDLs.OrderByDescending(p => p.TIENTOUR).ToList();
			return View(ctTour);
		}
	}
}