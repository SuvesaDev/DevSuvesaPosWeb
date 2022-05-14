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
    public class validafirmadocontadoController : Controller
    {

        private Negocio.Logica.ValidaFirmadoContado db = new Negocio.Logica.ValidaFirmadoContado();

        [HttpPost]
        public IActionResult Registrar(Datos.Models.ValidaFirmadocontado valida)
        {
            try
            {
                string resp = db.Crear(valida);

                double test;
                if (double.TryParse(resp, out test))// Si el resultado es numerico
                {
                    if (test > 0)//Si el resultado es mayor que cero
                    {
                        return Ok("Ok");
                    }
                    else
                    {
                        throw new Exception(resp);
                    }
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
        public IActionResult Actualizar(int id, Datos.Models.ValidaFirmadocontado valida)
        {
            try
            {

                string resp = db.Editar(id, valida);
                double test;
                if (double.TryParse(resp, out test))// Si el resultado es numerico
                {
                    if (test > 0)//Si el resultado es mayor que cero
                    {
                        return Ok("Ok");
                    }
                    else
                    {
                        throw new Exception(resp);
                    }
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
        public IActionResult Buscar()
        {
            var result = this.db.Buscar();
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
                double test;
                if (double.TryParse(resp, out test))// Si el resultado es numerico
                {
                    if (test > 0)//Si el resultado es mayor que cero
                    {
                        return Ok("Ok");
                    }
                    else
                    {
                        throw new Exception(resp);
                    }
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
