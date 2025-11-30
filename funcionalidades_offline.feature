Feature: Funcionamiento en Modo Offline y Sincronización
  Como usuario rural con conectividad limitada
  Quiero usar la app sin internet y sincronizar datos después
  Para no perder información en el campo

  # US12: Registrar actividades sin conexión [cite: 634]
  Scenario: Guardado local de datos sin internet
    Given que el dispositivo detecta [Estado de Red: Desconectado]
    When el usuario registra una nueva [Actividad de Siembra]
    And presiona el botón [Guardar]
    Then el sistema almacena los datos en la [Base de Datos Local SQLite]
    And marca el registro con el flag [Pendiente de Sincronización]

  # US14: Indicar estado de conexión [cite: 637]
  Scenario: Visualización de cambio a modo offline
    Given que la aplicación está en ejecución
    When se pierde la señal de [Internet/Datos]
    Then el sistema muestra un [Icono de Nube Tachada] en la barra superior
    And despliega un mensaje temporal [Conexión perdida, modo offline activado]

  # US13: Sincronización automática [cite: 636]
  Scenario: Sincronización al recuperar conexión
    Given que existen [Registros Locales] marcados como pendientes
    When el dispositivo detecta [Estado de Red: Conectado]
    Then el sistema inicia el [Servicio en Segundo Plano] para subir datos
    And al finalizar muestra la notificación [Sincronización completada]

  # US15: Validar datos antes de sincronizar [cite: 639]
  Scenario: Bloqueo de sincronización por datos corruptos
    Given que existe un registro local con el campo [Fecha] corrupto o vacío
    When el sistema intenta ejecutar la [Sincronización Automática]
    Then el validador rechaza el envío de ese registro específico
    And genera un reporte de [Error de Validación] en el log del sistema
    And no envía los datos al [Servidor Central]