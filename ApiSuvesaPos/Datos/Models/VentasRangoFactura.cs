﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Datos.Models
{
    public partial class VentasRangoFactura
    {
        public long Id { get; set; }
        public double NumFactura { get; set; }
        public string Tipo { get; set; }
        public long CodCliente { get; set; }
        public string NombreCliente { get; set; }
        public double? ManoObra { get; set; }
        public double ImpVenta { get; set; }
        public double Total { get; set; }
        public DateTime Fecha { get; set; }
        public double SubTotal { get; set; }
    }
}
