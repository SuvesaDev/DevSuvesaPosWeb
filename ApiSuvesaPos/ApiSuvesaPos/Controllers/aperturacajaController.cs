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
    public class aperturacajaController : Controller
    {

        private Datos.Class.AperturasCajas db = new Datos.Class.AperturasCajas();

        private bool Numerico(string text)
        {
            double test;
            return double.TryParse(text, out test);
        }


        [HttpPost]
        public IActionResult Registrar(Datos.Models.Aperturacaja apertura)
        {
            try
            {
                string resp = db.CrearAperturasCajas(apertura).ToString();

                if (resp.Equals("1"))
                {
                    return Ok(apertura);
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
        public IActionResult Actualizar(int id, Datos.Models.Aperturacaja apertura)
        {
            try
            {

                string resp = db.EditarAperturasCajas(id, apertura).ToString();
                if (resp.Equals("1"))
                {
                    return Ok(apertura);
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
            catch (Exception ex)
            {
                return new BadRequestResult();
            }
        }

        [HttpGet]
        public IActionResult Buscar(bool porid, string filtro)
        {

            if (porid == true && !this.Numerico(filtro))
            {
                return BadRequest("El parametro filtro no tiene el valor esperado. Se esperaba un valor numerico.");
            }

            var result = this.db.ObtenerAperturasCajas(porid, filtro);
            if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return new NoContentResult();
            }
        }

        [HttpPut]
        [Route("anular")]
        public IActionResult Eliminar(int id)
        {
            try
            {

                string resp = db.AnularAperturasCajas(id).ToString();
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
            catch (Exception ex)
            {
                return new BadRequestResult();
            }
        }

    }
}
