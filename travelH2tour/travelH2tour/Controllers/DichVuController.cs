using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using travelH2tour.Models;

namespace travelH2tour.Controllers
{
	public class DichVuController : Controller
	{
		dbTravelTourDataContext data = new dbTravelTourDataContext();
		// GET: DichVu
		public ActionResult loadDichVu()
		{
			var dichvu = from dv in data.DICHVUs select dv;
			return View(dichvu);
		}
	}
}