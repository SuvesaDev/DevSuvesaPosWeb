﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos.Models;
using Microsoft.EntityFrameworkCore;

namespace Datos.Class
{
    class CierreCaja
    {

        SeePOSContext entities;

        public CierreCaja()
        {
            entities = new SeePOSContext();
        }

        public int CrearAreas(Models.Cierrecaja area)
        {
            try
            {
                entities.Cierrecajas.Add(area);
                return entities.SaveChanges();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int AnularCierreCaja(int id)
        {
            try
            {
                var p = entities.Cierrecajas.Find(id);
                Models.Cierrecaja Nuevo = p;
                Nuevo.Anulado = true;

                entities.Entry(Nuevo).State = EntityState.Modified;

                return entities.SaveChanges();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public List<Models.Cierrecaja> ObtenerCierreCajas(bool porId, string Filtro)
        {
            try
            {
                List<Models.Cierrecaja> result;

                if (porId == false)
                {
                    var temp = from c in entities.Cierrecajas
                               join a in entities.Aperturacajas on c.Apertura equals a.Napertura
                               where a.Nombre.Contains(Filtro)
                               orderby c.Fecha descending
                               select c;
                    result = temp.ToList<Models.Cierrecaja>();
                }
                else
                {
                    var temp = from c in entities.Cierrecajas
                               where c.NumeroCierre == Convert.ToInt32(Filtro)                               
                               select c;
                    result = temp.ToList<Models.Cierrecaja>();
                }

                if (result.Count > 0)
                {
                    return result;
                }
                else
                {
                    return result = null;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
