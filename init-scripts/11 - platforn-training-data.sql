-- Content: Script to create tables for platform training
\c platform_training;

-- Change schema
SET search_path TO public;

INSERT INTO TBL_COMPANY(ID_COMPANY,NAME,COMPANY,URL_LOGO,STATUS)
VALUES (0,'DEMO COMPANY','0000000001','','Y');

INSERT INTO TBL_USER(ID_COMPANY,ID_USER,USERNAME,ENCODE,NIVEL,SECRET_CODE,ROLE,NAME,LAST_NAME,URL_PHOTO,EMAIL,ADDRESS,PHONE,COMMENT,REGIST_DATE,EXPIRE_DATE,STATUS)
VALUES(0,0,'ADMIN','$2a$10$Ds91T5oYBt3OJ7V068NuDeW.05wmTxLmKhg7CZijAeqDN8GuyIFq2',1,'KXJT7ADTPNAMIQQCOVBMVFIQNCOE2V6X','ADMIN','ADMINISTRATOR','','https://static.platzi.com/media/avatars/avatars/luis122448_ac7390d4-8893-4a46-9a7c-6be0ef544d85.png','','','','',null,null,'Y'),
      (0,1,'TEST','$2a$10$Ds91T5oYBt3OJ7V068NuDeW.05wmTxLmKhg7CZijAeqDN8GuyIFq2',1,'KXJT7ADTPNAMIQQCOVBMVFIQNCOE2V6X','TEST','TESTING','','https://static.platzi.com/media/avatars/avatars/luis122448_ac7390d4-8893-4a46-9a7c-6be0ef544d85.png','','','','',null,null,'Y'),
      (0,2,'USER','$2a$10$Ds91T5oYBt3OJ7V068NuDeW.05wmTxLmKhg7CZijAeqDN8GuyIFq2',1,'KXJT7ADTPNAMIQQCOVBMVFIQNCOE2V6X','USER','GENERIC USER','','https://static.platzi.com/media/avatars/avatars/luis122448_ac7390d4-8893-4a46-9a7c-6be0ef544d85.png','','','','',null,null,'Y'),
      (0,3,'ANONYMOUS','$2a$10$Ds91T5oYBt3OJ7V068NuDeW.05wmTxLmKhg7CZijAeqDN8GuyIFq2',1,'KXJT7ADTPNAMIQQCOVBMVFIQNCOE2V6X','USER','ANONYMOUS','','https://developer-bucket-luis122448.s3.us-west-2.amazonaws.com/platform-training/icon-anonymous.png','','','','',null,null,'Y'),
      (0,4,'SUPPORT','$2a$10$Ds91T5oYBt3OJ7V068NuDeW.05wmTxLmKhg7CZijAeqDN8GuyIFq2',1,'KXJT7ADTPNAMIQQCOVBMVFIQNCOE2V6X','USER','SUPPORT TSI','','https://developer-bucket-luis122448.s3.us-west-2.amazonaws.com/platform-training/icon-support.png','','','','',null,null,'Y');

INSERT INTO TBL_TEACHER(ID_COMPANY,ID_TEACHER,NAME,LAST_NAME,URL_PHOTO,STATUS)
VALUES (0,0,'DEMO TEACHER','','https://static.platzi.com/media/avatars/avatars/luis122448_ac7390d4-8893-4a46-9a7c-6be0ef544d85.png','Y');

INSERT INTO TBL_MODULE(ID_COMPANY,ID_MODULE,TITLE,DESCRIPTION, MARKDOWN_CONTENT,URL_ICON,URL_LOGO,URL_BACKGROUND,STATUS)
VALUES (0,1,'RR HH','RECURSOS HUMANOS','Bienvenido al Módulo de Recursos Humanos en el sistema ERP TSI. En esta sesión, exploraremos las funcionalidades clave de este módulo diseñado para optimizar la gestión de personal en tu empresa. Algunos aspectos destacados de esta clase incluyen:

- **Configuración Inicial:** Aprenderás a realizar la configuración inicial del módulo para adaptarlo a las necesidades específicas de tu empresa.

- **Registro y Seguimiento de Personal:** Exploraremos cómo el sistema facilita el registro y seguimiento de información detallada sobre cada miembro del personal.

- **Procesos de Nómina y Beneficios:** Descubre cómo el módulo gestiona eficientemente procesos relacionados con la nómina, beneficios y otros aspectos clave de recursos humanos.

¡Únete a nosotros para explorar las potentes herramientas del Módulo de Recursos Humanos, mejorando la eficiencia y transparencia en la gestión de personal con ERP TSI!
','https://web.grupotsiperu.com.pe:8843/assets/images/recursos-humanos.png','https://reisdigital.es/wp-content/uploads/2022/10/herramientas-de-recursos-humanos-para-optimizar-tu-negocio.jpg','https://reisdigital.es/wp-content/uploads/2022/10/herramientas-de-recursos-humanos-para-optimizar-tu-negocio.jpg','Y');

INSERT INTO TBL_EXAM (ID_COMPANY, ID_EXAM, ID_COURSE, TYPE_EXAM, TITLE, DESCRIPTION, MARKDOWN_CONTENT, NUMBER_QUESTIONS, TIME, MIN_SCORE, MAX_ATTEMPTS,STATUS)
VALUES (0, 1, 1, 'QUIZ', 'Planilla de Recursos Humanos en TSI Oracle', 'Este examen evalúa tu competencia en el manejo de la planilla de recursos humanos en el software TSI Oracle. Aborda temas esenciales como la gestión de nóminas, procesos de personal y cumplimiento normativo.', '', 20, 30, 10, 3,'Y');

INSERT INTO TBL_COURSE(ID_COMPANY,ID_COURSE,ID_MODULE,ID_TEACHER,TITLE,DESCRIPTION, MARKDOWN_CONTENT,URL_ICON,URL_LOGO,URL_BACKGROUND,ID_EXAM,STATUS)
VALUES (0,1,1,0,'Planilla de Recursos Humanos','Este curso proporciona una formación integral en el manejo de la planilla de recursos humanos utilizando el software TSI Oracle. Aprende a gestionar eficientemente nóminas, procesos de personal y cumplimiento normativo con esta capacitación especializada','Bienvenido a la gestión integral de la Planilla de Recursos Humanos en el sistema ERP TSI. En esta clase, exploraremos los aspectos esenciales relacionados con la planificación, configuración y ejecución de procesos clave en la gestión de personal. Algunos puntos destacados de la sesión incluyen:

- **Configuración Inicial:** Aprenderás a configurar parámetros fundamentales para la gestión efectiva de la planilla de recursos humanos.

- **Procesamiento de Datos:** Exploraremos cómo el sistema procesa y gestiona datos relacionados con la nómina y beneficios del personal.

- **Generación de Reportes:** Descubre las herramientas integradas para la generación de reportes detallados y análisis de la planilla.

Únete a nosotros mientras nos sumergimos en la Planilla de Recursos Humanos en el sistema ERP TSI, optimizando la gestión de personal en tu empresa.
','https://web.grupotsiperu.com.pe:8843/assets/images/recursos-humanos.png','','https://i.ibb.co/L84DDpP/background-rrhh.jpg',1,'Y');

INSERT INTO TBL_CLASS (ID_COMPANY, ID_CLASS, ID_COURSE, ID_TEACHER, TYPE_CLASS, POSITION, TITLE, DESCRIPTION, MARKDOWN_CONTENT, URL_IMAGE, ID_VIDEO, URL_VIDEO, STATUS)
VALUES (0, 1, 1, 0, 'PROMO', 1, 'ERP TSI PLANILLA DE RR.HH.', 'Video Promocional', 'Descubre la eficiencia y simplicidad del sistema ERP TSI en el manejo de la Planilla de Recursos Humanos. En esta sesión, exploraremos las funcionalidades clave de la planilla y cómo este sistema puede optimizar la gestión de recursos humanos en tu empresa. Algunos aspectos destacados incluyen:

- **Navegación Intuitiva:** Conoce la interfaz amigable que facilita la navegación y el acceso a información relevante.

- **Herramientas Avanzadas:** Descubre las herramientas avanzadas que simplifican la gestión de la planilla y permiten un seguimiento preciso.

- **Integración sin Problemas:** Aprende sobre la integración perfecta con otros módulos del sistema ERP TSI para una gestión integral de recursos.

Únete a nosotros para explorar cómo ERP TSI hace que la administración de la planilla sea más eficiente y efectiva.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', '0qGCO7cH_kg', 'https://www.youtube.com/embed/0qGCO7cH_kg', 'Y'),
       (0, 2, 1, 0, 'TAG', 1.5, 'Introducción y Configuraciones iniciales', '', '', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', '', '', 'Y'),
       (0, 3, 1, 0, 'CLASS', 2, 'Configuración', 'Introducción y Configuración del Módulo de Planilla', 'Bienvenido a la clase *Introducción y Configuración del Módulo de Planilla*. En esta sesión, exploraremos los conceptos básicos y las configuraciones iniciales necesarias para utilizar eficientemente el módulo de planilla en el sistema ERP TSI. A lo largo de la clase, abordaremos los siguientes puntos clave:

- **Introducción al Módulo de Planilla:** Comprenderemos la importancia de este módulo en la gestión eficaz de recursos humanos.

- **Configuración Inicial:** Exploraremos los pasos fundamentales para la configuración inicial del módulo, asegurando un uso adecuado y personalizado según las necesidades de tu empresa.

- **Aspectos Destacados:** Se destacarán características clave y consejos para optimizar la experiencia durante la configuración.

¡Prepárate para sumergirte en el fascinante mundo de la gestión de planillas con esta introducción detallada y práctica!
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'koWWF7jwdK8', 'https://www.youtube.com/embed/koWWF7jwdK8', 'Y'),
       (0, 4, 1, 0, 'CLASS', 3, 'Centro de Costos', 'Configuración y Asignación de Centros de Costos al Personal', 'En esta clase, nos sumergiremos en el proceso crucial de configurar y asignar centros de costos al personal dentro del sistema ERP TSI. Comprender la correcta configuración de esta función es esencial para una gestión financiera efectiva y un seguimiento detallado de los costos asociados a cada área de tu empresa. Algunos puntos destacados de la sesión incluyen:

- **Importancia de los Centros de Costos:** Exploraremos por qué la asignación adecuada de centros de costos es vital para la toma de decisiones estratégicas.

- **Pasos de Configuración:** Te guiaré a través de los pasos clave para configurar y asignar centros de costos de manera efectiva.

- **Casos Prácticos:** Analizaremos casos prácticos para comprender cómo esta configuración impacta en la contabilidad y la gestión financiera.

Únete a nosotros mientras desentrañamos los secretos de la configuración y asignación de centros de costos, asegurando una gestión financiera eficiente en tu empresa.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', '89U_qY29s', 'https://www.youtube.com/embed/89U_qY29s-g', 'Y'),
       (0, 5, 1, 0, 'CLASS', 4, 'Personal', 'Personal de la Planilla', 'En esta lección, nos sumergiremos en el fascinante mundo del personal de la planilla en el sistema ERP TSI. Exploraremos los detalles esenciales relacionados con la gestión de los datos del personal y cómo este módulo simplifica el proceso. Algunos aspectos destacados de la sesión incluyen:

- **Registro y Gestión de Datos:** Aprende a ingresar y gestionar la información del personal de manera eficiente.

- **Seguridad y Confidencialidad:** Descubre las características de seguridad integradas para garantizar la confidencialidad de los datos del personal.

- **Personalización de Perfiles:** Exploraremos cómo personalizar perfiles de personal según las necesidades específicas de tu empresa.

Únete a nosotros para adentrarte en el universo del personal de la planilla y maximiza el potencial del sistema ERP TSI en la gestión de recursos humanos.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'gvdFeK2HpHM', 'https://www.youtube.com/embed/gvdFeK2HpHM', 'Y'),
       (0, 6, 1, 0, 'CLASS', 5, 'Personal', 'Prestamos al Personal de la Planilla', 'En esta clase, exploraremos en detalle el proceso de gestión de préstamos para el personal dentro del sistema ERP TSI. Comprender cómo gestionar estos aspectos financieros es esencial para mantener una relación transparente y eficiente con tus empleados. Algunos puntos destacados de la sesión incluyen:

- **Configuración de Préstamos:** Aprende a configurar y estructurar adecuadamente los préstamos para el personal en el sistema.

- **Proceso de Solicitud:** Exploraremos el proceso de solicitud de préstamos por parte de los empleados y su registro en el sistema.

- **Seguimiento y Reportes:** Descubre cómo el sistema ERP TSI facilita el seguimiento y generación de reportes relacionados con los préstamos del personal.

Únete a nosotros mientras desentrañamos los secretos de la gestión de préstamos, asegurando una administración financiera eficiente y transparente en tu empresa.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'ZSGHWCe-A_E', 'https://www.youtube.com/embed/ZSGHWCe-A_E', 'Y'),
       (0, 7, 1, 0, 'TAG', 5.5, 'Procesos y Operaciones habituales', '', 'En esta clase, nos sumergiremos en el corazón del sistema ERP TSI para entender el proceso y cálculo de la planilla de manera detallada. Exploraremos los pasos esenciales para garantizar un procesamiento preciso y eficiente de la nómina de tu empresa. Algunos puntos destacados de la sesión incluyen:

- **Configuración de Parámetros:** Aprende a establecer los parámetros clave necesarios para el cálculo preciso de la planilla.

- **Inclusión de Variables:** Exploraremos cómo el sistema maneja las variables salariales y deducciones para cada empleado.

- **Generación de Reportes:** Descubre las herramientas integradas para la generación de reportes detallados después del cálculo de la planilla.

Únete a nosotros mientras profundizamos en el proceso y cálculo de la planilla, garantizando una gestión de nómina eficiente y sin complicaciones con ERP TSI.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', '', '', 'Y'),
       (0, 8, 1, 0, 'CLASS', 6, 'Procesar Planilla', 'Proceso y Cálculo de la Planilla', 'En esta clase, exploraremos en detalle el proceso y cálculo de la planilla en el sistema ERP TSI. Sumérgete en los aspectos fundamentales para asegurar una gestión precisa y eficiente de la nómina en tu empresa. Algunos puntos destacados de la sesión incluyen:

- **Configuración de Parámetros:** Aprenderás a establecer parámetros clave para el cálculo preciso de la planilla.

- **Inclusión de Variables:** Exploraremos cómo el sistema maneja variables salariales y deducciones para cada empleado.

- **Generación de Reportes:** Descubre las herramientas integradas para generar informes detallados tras el cálculo de la planilla.

Únete a nosotros mientras desentrañamos el proceso y cálculo de la planilla, garantizando una gestión de nómina eficiente y sin complicaciones con ERP TSI.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'IdBJbjKuMHw', 'https://www.youtube.com/embed/IdBJbjKuMHw', 'Y'),
       (0, 9, 1, 0, 'CLASS', 7, 'Planilla de Liquidación', 'Planilla de Liquidación', 'En esta sesión, nos adentraremos en la Planilla de Liquidación dentro del sistema ERP TSI, comprendiendo en detalle el proceso y la importancia de este componente esencial en la gestión de recursos humanos. Algunos puntos destacados de la clase incluyen:

- **Definición de Conceptos:** Entenderemos los conceptos clave asociados a la liquidación de empleados.

- **Cálculo de Beneficios y Deducciones:** Exploraremos cómo el sistema calcula los beneficios y deducciones durante el proceso de liquidación.

- **Documentación Legal:** Analizaremos la documentación legal necesaria y generada durante la planilla de liquidación.

Únete a nosotros mientras exploramos la Planilla de Liquidación en el sistema ERP TSI, garantizando una gestión transparente y eficiente del proceso de finalización de empleados en tu empresa.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'p_GalfWzeyU', 'https://www.youtube.com/embed/p_GalfWzeyU', 'Y'),
       (0, 10, 1, 0, 'CLASS', 8, 'Planilla de Gratificación', 'Planilla de Gratificación', 'En esta lección, profundizaremos en la Planilla de Gratificación dentro del sistema ERP TSI, comprendiendo su importancia y el proceso detallado para su correcta gestión. Algunos aspectos destacados de la clase incluyen:

- **Definición de Gratificación:** Entenderemos en qué consiste la gratificación y su papel en la remuneración de los empleados.

- **Cálculo y Distribución:** Exploraremos cómo el sistema realiza el cálculo y la distribución de las gratificaciones de manera automática.

- **Aspectos Legales y Regulatorios:** Analizaremos los aspectos legales y regulatorios asociados a la gratificación, asegurando el cumplimiento normativo.

Únete a nosotros para sumergirte en la Planilla de Gratificación, optimizando su gestión y garantizando una compensación justa y transparente para tus empleados en el sistema ERP TSI.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'rCwozymO18c', 'https://www.youtube.com/embed/rCwozymO18c', 'Y'),
       (0, 11, 1, 0, 'CLASS', 10, 'Planilla de Vacaciones', 'Planilla de Vacaciones', 'En esta clase, nos sumergiremos en la gestión de la Planilla de Vacaciones dentro del sistema ERP TSI. Exploraremos el proceso detallado para gestionar las vacaciones de los empleados, asegurando una administración eficiente y cumplimiento normativo. Algunos puntos destacados de la sesión incluyen:

- **Solicitud y Aprobación:** Aprenderás cómo los empleados solicitan vacaciones y cómo estas son aprobadas en el sistema.

- **Cálculo de Beneficios:** Exploraremos cómo el sistema realiza el cálculo de beneficios asociados a las vacaciones.

- **Registro y Seguimiento:** Descubre cómo el sistema facilita el registro y seguimiento de las vacaciones, manteniendo un historial preciso.

Únete a nosotros para explorar la Planilla de Vacaciones en el sistema ERP TSI, garantizando una gestión eficiente y transparente del tiempo de descanso para tus empleados.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'VLMxcD9Gy0E', 'https://www.youtube.com/embed/VLMxcD9Gy0E', 'Y'),
       (0, 12, 1, 0, 'TAG', 10.5, 'Reportes y Fórmulas', '', '', '', '', '', 'Y'),
       (0, 13, 1, 0, 'CLASS', 11, 'AFP, CTS y Reportes', 'Pagos de la AFP NET, CTS y Consistencia y Explicación de Reportes', 'En esta clase, abordaremos de manera detallada los pagos de la AFP NET, CTS, y la consistencia de la Planilla dentro del sistema ERP TSI. Exploraremos los procesos de pago a entidades como la AFP NET y CTS, así como la generación y explicación de reportes asociados. Algunos aspectos destacados de la sesión incluyen:

- **Proceso de Pagos:** Aprenderás sobre el procedimiento de pagos a la AFP NET y CTS, asegurando la correcta transferencia de fondos.

- **Consistencia de la Planilla:** Exploraremos cómo el sistema verifica la consistencia de la planilla para evitar errores y discrepancias.

- **Generación y Explicación de Reportes:** Analizaremos la generación de reportes detallados y cómo interpretarlos para una comprensión completa.

Únete a nosotros mientras exploramos estos aspectos cruciales de la gestión de pagos y reportes en el sistema ERP TSI, garantizando una administración financiera precisa y transparente.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'XZ10e7B9pBc', 'https://www.youtube.com/embed/XZ10e7B9pBc', 'Y'),
       (0, 14, 1, 0, 'CLASS', 12, 'Fórmulas de Planilla', 'Fórmulas de Planilla', 'En esta sesión, nos sumergiremos en el fascinante mundo de las Fórmulas de Planilla dentro del sistema ERP TSI. Exploraremos cómo estas fórmulas son fundamentales para el cálculo preciso de la remuneración de los empleados. Algunos aspectos destacados de la clase incluyen:

- **Importancia de las Fórmulas:** Comprenderemos por qué las fórmulas son esenciales para el cálculo exacto de la planilla.

- **Tipos de Fórmulas:** Exploraremos diversos tipos de fórmulas utilizadas en la gestión de planillas, desde cálculos simples hasta fórmulas más complejas.

- **Configuración y Personalización:** Aprenderás cómo configurar y personalizar fórmulas según las necesidades específicas de tu empresa.

Únete a nosotros mientras desentrañamos las Fórmulas de Planilla en el sistema ERP TSI, asegurando una gestión precisa y eficiente de la remuneración de tus empleados.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'uYx-Wm7BCWc', 'https://www.youtube.com/embed/uYx-Wm7BCWc', 'Y'),
       (0, 15, 1, 0, 'TAG', 12.5, 'Soporte Contable', '', '', '', '', '', 'Y'),
       (0, 16, 1, 0, 'CLASS', 13, 'Contabilizar Planilla', 'Contabilizar Contablemente la Planilla', 'En esta sesión, exploraremos el proceso esencial de contabilización contable de la planilla dentro del sistema ERP TSI. Comprenderemos la relevancia de esta etapa para mantener la integridad financiera y cumplir con las normativas contables. Algunos aspectos destacados de la clase incluyen:

- **Configuración Contable:** Aprenderás a configurar los parámetros contables necesarios para la contabilización precisa de la planilla.

- **Registro Automático:** Exploraremos cómo el sistema realiza el registro automático de las transacciones contables asociadas a la planilla.

- **Reconciliación y Verificación:** Descubre cómo el sistema facilita la reconciliación y verificación de las transacciones contables generadas.

Únete a nosotros mientras profundizamos en el proceso de contabilización contable de la planilla en el sistema ERP TSI, asegurando una gestión financiera eficiente y conforme a las normativas contables en tu empresa.
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'XkbXAp_dGyI', 'https://www.youtube.com/embed/XkbXAp_dGyI', 'Y'),
       (0, 17, 1, 0, 'TAG', 13.5, 'Despedida', '', '', '', '', '', 'Y'),
       (0, 18, 1, 0, 'FINAL', 14, 'Disposiciones Finales', 'Disposiciones Finales', 'En esta última sesión, abordaremos las Disposiciones Finales en el sistema ERP TSI. Exploraremos los puntos clave que debes considerar al finalizar y cerrar procesos relacionados con la planilla. Algunos aspectos destacados de esta clase incluyen:

- **Revisión de Procesos:** Repasaremos los procesos clave relacionados con la planilla para garantizar la exactitud de los datos.

- **Cierre de Período:** Aprenderás a realizar el cierre adecuado del período, asegurando la consistencia en los registros contables.

- **Respaldo y Archivado:** Exploraremos las mejores prácticas para respaldar y archivar la información de la planilla de manera segura.

¡Únete a nosotros para cerrar con éxito el ciclo de la planilla en el sistema ERP TSI, implementando las disposiciones finales de manera eficiente y organizada!
', 'https://i.ibb.co/L84DDpP/background-rrhh.jpg', 'koWWF7jwdK8', 'https://www.youtube.com/embed/koWWF7jwdK8', 'Y');

INSERT INTO TBL_COMMENT (ID_COMPANY, ID_COMMENT, ID_CLASS, TYPE_COMMENT, REGISTER_USER, REGISTER_DATE, LIKE_COMMENT, DISLIKE_COMMENT, MARKDOWN_CONTENT, ID_COMMENT_REF, STATUS)
VALUES
    (0, 1, 3, 'QUEST', 4, '01-01-2022', 5, 1, 'Hola, ¿cómo creo un nuevo **CARGO**?', NULL, 'Y'),
    (0, 2, 3, 'RESPONSE', 3, '01-01-2022', 2, 0, 'En la sección de mantenimiento, encontrará la opción de **CARGO**, ahí haga clic en agregar y aparecerá', 1, 'Y'),
    (0, 3, 3, 'RESPONSE', 4, '01-01-2022', 1, 0, 'En realidad no lo encuentro, ¿podría guiarme?', 1, 'Y'),
    (0, 4, 3, 'RESPONSE', 3, '01-01-2022', 2, 0, 'Adjunto Imagen ![image](https://testing.grupotsiperu.com.pe:8844/assets/images/logo-tsi-tres.png)', 1, 'Y'),
    (0, 5, 3, 'RESPONSE', 4, '01-01-2022', 1, 0, '¡Muchas Gracias!', 1, 'Y'),
    (0, 6, 1, 'CONTRIBUTION',3,'01-01-2022',10,0,'Muy emocionado por empezar!',NULL,'Y'),
    (0, 7, 1, 'QUEST',3,'01-01-2022',8,0,'La planilla viene integrado dentro del TSI Commercial?',NULL,'Y'),
    (0, 8, 1, 'RESPONSE',4,'01-01-2022',6,0,'No, es un modulo que se contrata independientemente',7,'Y'),
    (0, 9, 1, 'RESPONSE',4,'01-01-2022',2,0,'Para mayor información comunicarse al **999-999-999**',7,'Y'),
    (0, 10, 1, 'CONTRIBUTION',3,'01-01-2022',1,0,'Iniciando con todo!',NULL,'Y');


