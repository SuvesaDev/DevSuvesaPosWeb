﻿using System;
using System.Collections.Generic;

#nullable disable

namespace DatosFE.Models
{
    public partial class CartaExoneracion
    {
        public decimal Id { get; set; }
        public long Identificacion { get; set; }
        public int IdTipoExoneracion { get; set; }
        public string NumeroDocumento { get; set; }
        public DateTime FechaEmision { get; set; }
        public DateTime FechaVence { get; set; }
        public double PorcentajeCompra { get; set; }
        public double Impuesto { get; set; }
        public string Nota { get; set; }
    }
}
