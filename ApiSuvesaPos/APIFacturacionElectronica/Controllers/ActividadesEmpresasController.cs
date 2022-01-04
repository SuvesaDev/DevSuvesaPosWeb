﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using APIFacturacionElectronica.Models;

namespace APIFacturacionElectronica.Controllers
{
    public class ActividadesEmpresasController : Controller
    {

        NegocioFE.Logica.ActividadEmpresa db = new NegocioFE.Logica.ActividadEmpresa();

        [HttpPost]
        public IActionResult PostActividadesEmpresas( ActividadesEmpresas evidencia)
        {
            try
            {
                string resp = "";//db.CrearEvidencia(evidencia); //como este ejemplo

                if (resp.Equals("1"))
                {
                    return CreatedAtRoute("DefaultApi", new {Actividad = evidencia.Actividad }, evidencia);
                }
                else if (resp.Equals("La actividad no existe"))
                {
                    return NotFound();
                }
                else
                {
                    throw new Exception(resp);
                }

            }
            catch (Exception ex)
            {
                return new BadRequestResult();
            }
        }

        [HttpGet("{id}")]
        public IActionResult GetObtenerActividadesEmpresa(int id)
        {

            var result = "lista que se obtiene desde negocio"; //this._context.Books.Include(c => c.Authors).SingleOrDefault(t => t.Id_Book == id);
            if (id == 0)
            {
                return BadRequest();
            }
            else if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return new NoContentResult();
            }
        }
    }
}
