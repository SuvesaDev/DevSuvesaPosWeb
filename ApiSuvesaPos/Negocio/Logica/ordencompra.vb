﻿Namespace Logica
    Public Class ordencompra

        Public Property Moneda As New Logica.Monedas
        Public Property Proveedores As New Logica.Proveedores
        Public Property Inventario As New Logica.Inventario

        Public Function Buscar() As List(Of Modelo.ordencompra)


            'Dim identificador As Double

            'Dim Fx As New cFunciones

            'identificador = CDbl(Fx.Buscar_X_Descripcion_Fecha("Select Orden, Nombre,Fecha from ordencompra Order by Fecha DESC", "Nombre", "Fecha", "Buscar Orden de Compra"))
            'buscando = True
            'If identificador = 0.0 Then ' si se dio en el boton de cancelar
            '    Me.buscando = False
            '    Exit Sub
            'End If

        End Function

        Public Sub Crear(ordencompra As Modelo.ordencompra)


            'Function RegistrarOrden() As Boolean

            '    If Me.SqlConnection1.State <> Me.SqlConnection1.State.Open Then Me.SqlConnection1.Open()
            '    Dim Trans As SqlTransaction = Me.SqlConnection1.BeginTransaction
            '    Try

            '        Me.Adapter_Orden_Compra.InsertCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.InsertCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.UpdateCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.UpdateCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.DeleteCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.DeleteCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.Update(Me.DataSetOrden_Compras1, "ordencompra")
            '        Me.Adapter_Detalle_Orden_Compras.Update(Me.DataSetOrden_Compras1, "detalle_ordencompra")
            '        Trans.Commit()
            '        Return True

            '    Catch ex As Exception
            '        Trans.Rollback()
            '        MsgBox(ex.Message)
            '        Me.ToolBar1.Buttons(2).Enabled = True
            '        Return False
            '    End Try


            'End Function

        End Sub

        Public Sub Editar(ordencompra As Modelo.ordencompra)


            'Function RegistrarOrden() As Boolean

            '    If Me.SqlConnection1.State <> Me.SqlConnection1.State.Open Then Me.SqlConnection1.Open()
            '    Dim Trans As SqlTransaction = Me.SqlConnection1.BeginTransaction
            '    Try

            '        Me.Adapter_Orden_Compra.InsertCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.InsertCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.UpdateCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.UpdateCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.DeleteCommand.Transaction = Trans
            '        Me.Adapter_Detalle_Orden_Compras.DeleteCommand.Transaction = Trans

            '        Me.Adapter_Orden_Compra.Update(Me.DataSetOrden_Compras1, "ordencompra")
            '        Me.Adapter_Detalle_Orden_Compras.Update(Me.DataSetOrden_Compras1, "detalle_ordencompra")
            '        Trans.Commit()
            '        Return True

            '    Catch ex As Exception
            '        Trans.Rollback()
            '        MsgBox(ex.Message)
            '        Me.ToolBar1.Buttons(2).Enabled = True
            '        Return False
            '    End Try


            'End Function

        End Sub

        Public Sub Anular()

            'Function AnularOrden()
            '    Try
            '        Dim resp As Integer
            '        If Me.BindingContext(Me.DataSetOrden_Compras1, "ordencompra").Count > 0 Then
            '            If Me.BindingContext(Me.DataSetOrden_Compras1, "ordencompra.ordencompradetalle_ordencompra").Count > 0 Then

            '                resp = MessageBox.Show("¿Desea Anular esta Orden de Compra...?", "Seepos", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1)
            '                If resp = 6 Then
            '                    CheckBox1.Checked = True
            '                    Me.BindingContext(Me.DataSetOrden_Compras1, "ordencompra").EndCurrentEdit()

            '                    Me.DataSetOrden_Compras1.AcceptChanges()
            '                    MsgBox("La Orden de Compra ha sido anulada correctamente", MsgBoxStyle.Information)
            '                    Me.DataSetOrden_Compras1.detalle_ordencompra.Clear()
            '                    Me.DataSetOrden_Compras1.ordencompra.Clear()

            '                    Me.ToolBar1.Buttons(4).Enabled = True
            '                    Me.ToolBar1.Buttons(1).Enabled = True

            '                    Me.ToolBar1.Buttons(0).Text = "Nuevo"
            '                    Me.ToolBar1.Buttons(0).ImageIndex = 0
            '                    Me.ToolBar1.Buttons(3).Enabled = False
            '                    Me.ToolBar1.Buttons(2).Enabled = False
            '                    Me.ToolBar1.Buttons(4).Enabled = False


            '                    Me.txtUsuario.Enabled = True
            '                    Me.txtUsuario.Text = ""
            '                    Me.txtNombreUsuario.Text = ""
            '                    Me.txtUsuario.Focus()
            '                Else : Exit Function

            '                End If
            '            End If
            '        End If

            '    Catch ex As System.Exception
            '        MsgBox(ex.Message)
            '    End Try
            'End Function

        End Sub

    End Class
End Namespace