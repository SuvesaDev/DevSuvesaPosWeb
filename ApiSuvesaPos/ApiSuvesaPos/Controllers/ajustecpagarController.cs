﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using Negocio.Logica;

namespace ApiSuvesaPos.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ajustecpagarController : Controller
    {
        private Negocio.Logica.Ajustecpagar db = new Negocio.Logica.Ajustecpagar();

        private bool Numerico(string text)
        {
            double test;
            return double.TryParse(text, out test);
        }

        [HttpPost]
        public IActionResult PostAjustecpagar(Datos.Models.Ajustescpagar nuevo)
        {
            try
            {

                string resp = db.Crear(nuevo);

                // OJO
                // Este loco devuelve 2 

                if (resp.Equals("2"))
                {
                    return Ok("Ok");
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

        [HttpPut]
        public IActionResult PutAjustecpagar(long id)
        {

            string resp = this.db.Anular(id);
            if (resp.Equals("1"))
            {
                return Ok("Ok");
            }
            else if (resp.Equals("No existe el valor"))
            {
                return NotFound();
            }
            else
            {
                throw new Exception(resp);
            }
        }

        [HttpGet]
        public IActionResult GetAjustecpagar(bool porid, string filtro)
        {
            if (porid == true && !this.Numerico(filtro))
            {
                return BadRequest("El parametro filtro no tiene el valor esperado. Se esperaba un valor numerico.");
            }

            var result = this.db.Buscar(porid,filtro);
            if (result != null)
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