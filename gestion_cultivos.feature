Feature: Gestión de Cultivos y Actividades Agrícolas
  Como agricultor
  Quiero registrar mis cultivos y actividades diarias
  Para llevar un control ordenado y evitar pérdidas

  # US01: Registrar un nuevo cultivo [cite: 618]
  Scenario: Registro exitoso de un nuevo cultivo
    Given que el agricultor se encuentra en la pantalla [Inicio]
    When hace clic en el botón [Agregar Cultivo]
    And completa el campo [Nombre del Cultivo] con "Maíz Amiláceo"
    And selecciona el [Tipo de Cultivo] con "Cereales"
    And ingresa el dato [Área] con "2 hectáreas"
    And ingresa la [Ubicación] con "Parcela Norte"
    And hace clic en el botón [Guardar]
    Then el sistema muestra el mensaje [Cultivo agregado con éxito]
    And el nuevo cultivo aparece en la [Lista de Cultivos Activos]

  Scenario: Error al registrar cultivo con datos incompletos
    Given que el agricultor está en el formulario [Nuevo Cultivo]
    When deja el campo [Nombre del Cultivo] vacío
    And hace clic en el botón [Guardar]
    Then el sistema muestra el mensaje de error [Por favor complete todos los campos correctamente]
    And no se guarda el registro en la base de datos

  # US04: Registrar actividad agrícola diaria [cite: 623]
  Scenario: Registro de una actividad de riego
    Given que el agricultor ha seleccionado el cultivo "Maíz Amiláceo"
    When hace clic en el botón [Agregar Actividad]
    And selecciona el [Tipo de Actividad] como "Riego"
    And ingresa la [Fecha] actual
    And escribe en [Descripción] "Riego por goteo duración 2 horas"
    And presiona el botón [Guardar]
    Then el sistema registra la actividad en el [Historial del Cultivo]
    And muestra la confirmación [Actividad registrada correctamente]