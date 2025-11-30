Feature: Supervisión y Asignación de Tareas
  Como supervisor agrícola
  Quiero asignar y validar tareas de los agricultores
  Para optimizar el trabajo del equipo

  # US34: Asignar tareas a agricultores [cite: 664]
  Scenario: Asignación exitosa de tarea a un agricultor
    Given que el supervisor ha iniciado sesión en la app
    When selecciona al agricultor [Juan Perez] de la lista
    And hace clic en [Nueva Tarea]
    And ingresa el [Título] "Fertilización de zona sur"
    And define la [Fecha Límite] para "2025-11-30"
    And presiona el botón [Asignar]
    Then el sistema guarda la tarea con estado [Pendiente]
    And envía una [Notificación Push] al dispositivo del agricultor

  # US36: Validar cumplimiento de tareas [cite: 667]
  Scenario: Validación de tarea con evidencia fotográfica
    Given que el agricultor ha subido una [Foto de Evidencia] para la tarea "Fertilización"
    When el supervisor visualiza la [Imagen] en el detalle de la tarea
    And hace clic en el botón [Aprobar Tarea]
    Then el sistema cambia el estado de la tarea a [Completada]
    And se actualiza el [Indicador de Cumplimiento] del agricultor

  Scenario: Rechazo de tarea por falta de evidencia
    Given que la tarea figura como "Realizada" pero no tiene [Archivo Adjunto]
    When el supervisor intenta presionar [Aprobar Tarea]
    Then el sistema muestra el mensaje de error [No hay evidencia disponible]
    And habilita la opción [Solicitar Corrección]