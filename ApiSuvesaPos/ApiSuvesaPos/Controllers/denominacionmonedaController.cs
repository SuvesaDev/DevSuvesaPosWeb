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
    public class denominacionmonedaController : Controller
    {

        private Negocio.Logica.Denominacion_Moneda db = new Negocio.Logica.Denominacion_Moneda();

        private bool Numerico(string text)
        {
            double test;
            return double.TryParse(text, out test);
        }


        [HttpPost]
        public IActionResult Registrar(Datos.Models.DenominacionMonedum bodega)
        {
            try
            {
                string resp = db.Crear(bodega);

                if (resp.Equals("1"))
                {
                    return Ok(bodega);
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
        public IActionResult Actualizar(int id, Datos.Models.DenominacionMonedum bodega)
        {
            try
            {

                string resp = db.Editar(id, bodega);
                if (resp.Equals("1"))
                {
                    return Ok(bodega);
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
        public IActionResult Buscar(bool pornombre, string filtro)
        {

            if (pornombre == false && !this.Numerico(filtro))
            {
                return BadRequest("El parametro filtro no tiene el valor esperado. Se esperaba un valor numerico.");
            }

            var result = this.db.Buscar(pornombre, filtro);
            if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return new NoContentResult();
            }
        }

        [HttpDelete]
        public IActionResult Eliminar(int id)
        {
            try
            {

                string resp = db.Eliminar(id);
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