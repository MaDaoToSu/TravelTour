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
		public ActionResult tour()
		{
			var ctTour = from CT_Tour in data.CT_TOURs select CT_Tour;
			return View(ctTour);
		}
	}
}