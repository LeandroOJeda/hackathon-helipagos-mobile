# Cómo correr tu aplicación Flutter en un dispositivo Android

A continuación, te proporciono una guía paso a paso para correr tu aplicación Flutter en un dispositivo Android.

## Paso 1: Configura tu dispositivo Android

Antes de poder correr tu aplicación, necesitas configurar tu dispositivo Android para el modo de depuración.

1. Ve a `Configuración > Acerca del teléfono`.
2. Toca `Número de compilación` siete veces para activar las `Opciones de desarrollador`.
3. Regresa a la pantalla principal de `Configuración` y toca `Opciones de desarrollador`.
4. Activa `Depuración USB`.

## Paso 2: Clona tu repositorio

Clona tu repositorio de Flutter en tu máquina local usando Git.

```bash
git clone https://github.com/username/flutter-app.git
cd flutter-app
```

## Paso 3: Conecta tu dispositivo Android

Conecta tu dispositivo Android a tu máquina a través de USB. Asegúrate de que tu dispositivo esté correctamente conectado y visible para Flutter.

```bash
flutter devices
```

Deberías ver el nombre de tu dispositivo en la lista de dispositivos conectados.

## Paso 4: Corre la aplicación

Finalmente, puedes correr la aplicación en tu dispositivo.

```bash
flutter run
```

Tu aplicación ahora debería estar corriendo en tu dispositivo Android.

Espero que esta guía te sea útil. Si tienes alguna pregunta o encuentras algún problema, no dudes en preguntar.
