﻿using ABMC_Clientes.Business;
using ABMC_Clientes.Clases;
using System;
using System.Windows.Forms;

namespace ABMC_Clientes.GUI {
	public partial class FormABMCPruebas : Form {
		enum State { None, Nuevo, Consultar }
		private State operacion;

		bool nuevo { get { return operacion == State.Nuevo; } }
		bool consultar { get { return operacion == State.Consultar; } }

		public FormABMCPruebas() {
			InitializeComponent();
		}

		private void Form1_Shown(object sender, System.EventArgs e) {
			Habilitar(false);
			RefreshData();
			ActualizarCampos();
		}

		void RefreshData() {
			PruebasBusiness prueba = new PruebasBusiness();
			Prueba[] pruebas = prueba.ConsultarPruebas();
			grdPruebas.Rows.Clear();
			CargarGrilla(grdPruebas, pruebas);
		}

		void Habilitar(bool estado) {
			txtDescripcion.Enabled = estado;
			txtIdProyecto.Enabled = estado;
			txtIdPrueba.Enabled = estado;
			txtIdResponsable.Enabled = estado;
			txtNombre.Enabled = estado;
			btnAceptar.Enabled = estado;
			btnCancelar.Enabled = estado;

			btnAgregar.Enabled = !estado;
			btnEditar.Enabled = !estado;
			btnEliminar.Enabled = !estado;
			btnConsultar.Enabled = !estado;
		}

		void CargarGrilla(DataGridView grid, Prueba[] datos) {
			grid.Rows.Clear();
			if (datos == null)
				return;
			foreach (Prueba p in datos) {
				grid.Rows.Add(
					p.Id_plan_prueba, p.Id_proyecto, p.Nombre, p.Id_responsable, p.Descripcion);
			}
		}

		private void ActualizarCampos() {
			if (grdPruebas.Rows.Count == 0 || grdPruebas.SelectedRows.Count == 0)
				return;
			DataGridViewRow tabla = grdPruebas.SelectedRows[0];
			txtIdPrueba.Text = tabla.Cells[0].Value.ToString();
			txtIdProyecto.Text = tabla.Cells[1].Value.ToString();
			txtNombre.Text = tabla.Cells[2].Value.ToString();
			txtIdResponsable.Text = tabla.Cells[3].Value.ToString();
			txtDescripcion.Text = tabla.Cells[4].Value.ToString();
		}

		public void Limpiar() {
			txtDescripcion.Text = "";
			txtIdProyecto.Text = "";
			txtIdPrueba.Text = "";
			txtIdResponsable.Text = "";
			txtNombre.Text = "";
		}

		private void btnAgregar_Click(object sender, EventArgs e) {
			this.Habilitar(true);
			operacion = State.Nuevo;
			this.Limpiar();
			this.txtNombre.Focus();
		}

		private void btnAceptar_Click(object sender, EventArgs e) {
			if (nuevo) {
				AgregarPrueba();
			} else if (consultar) {
				ConsultarPruebas();
			} else {
				ActualizarPrueba();
			}

			Habilitar(false);
		}

		void AgregarPrueba() {
			PruebasBusiness pBusiness = new PruebasBusiness();
			if (txtIdProyecto.Text == "" || txtNombre.Text == "" || txtIdResponsable.Text == "" ||
				txtDescripcion.Text == "") {

				MessageBox.Show("Complete todos los campos", "Error", MessageBoxButtons.OK);
				txtIdPrueba.Focus();
				return;
			}

			Prueba prueba = new Prueba {
				Id_plan_prueba = 0,
				Id_proyecto = int.Parse(txtIdProyecto.Text),
				Nombre = txtNombre.Text,
				Id_responsable = int.Parse(txtIdResponsable.Text),
				Descripcion = txtDescripcion.Text,
				Borrado = false
			};

			pBusiness.Insertar(prueba);
			RefreshData();
		}

		void ConsultarPruebas() {
			PruebasBusiness pBusiness = new PruebasBusiness();
			CargarGrilla(grdPruebas, pBusiness.ConsultarPruebasFiltrado(
					id_plan_prueba: txtIdPrueba.Text == "" ? -1 : int.Parse(txtIdPrueba.Text),
					id_proyecto: txtIdProyecto.Text == "" ? -1 : int.Parse(txtIdProyecto.Text),
					nombre: txtNombre.Text,
					id_responsable: txtIdResponsable.Text == "" ? -1 : int.Parse(txtIdResponsable.Text),
					descripcion: txtDescripcion.Text
					));
		}

		void ActualizarPrueba() {
			PruebasBusiness pBusiness = new PruebasBusiness();
			Prueba prueba = new Prueba {
				Id_plan_prueba = int.Parse(txtIdPrueba.Text),
				Id_proyecto = int.Parse(txtIdProyecto.Text),
				Nombre = txtNombre.Text,
				Id_responsable =int.Parse(txtIdResponsable.Text),
				Descripcion = txtDescripcion.Text,
				Borrado = false
			};

			pBusiness.ActualizarPrueba(prueba);
			RefreshData();
		}

		private void btnEditar_Click(object sender, EventArgs e) {
			this.Habilitar(true);
			operacion = State.None;
		}

		private void btnConsultar_Click(object sender, EventArgs e) {
			Habilitar(true);
			txtIdPrueba.Enabled = true;
			operacion = State.Consultar;
		}

		private void btnEliminar_Click(object sender, EventArgs e) {
			if (MessageBox.Show("¿Desea eliminar la prueba de id " + txtIdPrueba.Text + "?", "Eliminando prueba", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.OK) {
				PruebasBusiness pBusiness = new PruebasBusiness();

				pBusiness.Eliminar(int.Parse(txtIdPrueba.Text));
				RefreshData();
				Habilitar(false);
			}
		}

		private void btnCancelar_Click(object sender, EventArgs e) {
			Limpiar();
			Habilitar(false);
			operacion = State.None;
		}

		private void btnSalir_Click(object sender, EventArgs e) {
			Close();
		}

		private void grdPruebas_SelectionChanged(object sender, EventArgs e) {
			ActualizarCampos();
		}
	}
}