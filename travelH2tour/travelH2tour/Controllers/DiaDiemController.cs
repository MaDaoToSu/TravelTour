using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using travelH2tour.Models;

namespace travelH2tour.Controllers
{
	public class DiaDiemController : Controller
	{
		dbTravelTourDataContext data = new dbTravelTourDataContext();
		// GET: DiaDiem
		public ActionResult HienThiDiaDiem()
		{
			var diadiem = from diaDiem in data.DIADIEMs select diaDiem;
			return View(diadiem);
		}

		public ActionResult CT_DiaDiem(int id)
		{
			var ctTour = from CT_Tour in data.CT_TOURs where CT_Tour.TOURDL.MADIADIEM == id select CT_Tour;
			return View(ctTour);
		}
	}
}