BACKEND
src/
│   ├── server/
│   │   ├── services/                  Lógica de negocio
│   │   │    AuthService.js        Registro, login, verificación
│   │   │    UserService.js        Gestión usuarios, búsqueda, estadisticas
│   │   │    AdminService.js       Dashboard, auditoría, cambios de rol
│   │   │    JobService.js         (Por implementar)
│   │   │
│   │   ├── middleware/                -Validación y manejo de errores
│   │   │    errorHandler.js       Errores global, JSON, validaciones
│   │   │
│   │   ├── validators/                -Esquemas de validación
│   │   │   authValidator.js       usuario, contraseña y email
│   │   │   userValidator.js       validar usuario
│   │   │   jobValidator.js        validar trabajo
│   │   │
│   │   ├── utils/                    -Funciones auxiliares
│   │   │   hash.js              Encriptación bcrypt
│   │   │   response.js           Respuestas HTTP estandarizadas
│   │   │   pagination.js         Paginación
│   │   │   jwt.js                Por implementar
│   │   │
│   │   └── constants/               -Constantes globales
│   │       errors.js             Mensajes de error, códigos HTTP
│   │       roles.js              Tipos de usuarios
│   │       messages.js           Mensajes del sistema
│   │
│   ├── app/api/                       -Rutas API
│   │   └── v1/                       Versionado - por implementar
│   │       ├── auth/
│   │       │    register/route.js
│   │       │    login/route.js
│   │       │    logout/route.js
│   │       ├── usuarios/
│   │       │    route.js       GET lista, POST crear
│   │       │   id/route.js     GET, PATCH, DELETE
│   │       └── admin/
│   │           dashboard/route.js
│   │
│   └── lib/
│       db.js                      -Conexión Prisma
│
└──  DATABASE
    prisma/
        schema.prisma              -Modelo User con enums
        migrations/