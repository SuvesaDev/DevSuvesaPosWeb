﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Datos.Models
{
    public partial class OpcionesDePago
    {
        public OpcionesDePago()
        {
            DetallePagoCajas = new HashSet<DetallePagoCaja>();
        }

        public long Id { get; set; }
        public double Documento { get; set; }
        public string TipoDocumento { get; set; }
        public double MontoPago { get; set; }
        public string FormaPago { get; set; }
        public double Denominacion { get; set; }
        public string Usuario { get; set; }
        public string Nombre { get; set; }
        public int CodMoneda { get; set; }
        public string Nombremoneda { get; set; }
        public double TipoCambio { get; set; }
        public DateTime Fecha { get; set; }
        public long Numapertura { get; set; }
        public double Vuelto { get; set; }
        public string NumeroDocumento { get; set; }
        public int? IdSucursal { get; set; }

        public virtual ICollection<DetallePagoCaja> DetallePagoCajas { get; set; }
    }
}
