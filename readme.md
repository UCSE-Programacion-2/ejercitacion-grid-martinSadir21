[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/-2aEi7Wc)
# Ejercitación: InstaFront con CSS Grid

## Objetivo de la práctica

En esta actividad vas a maquetar una interfaz de Instagram-like usando **CSS Grid** y enfoque **Mobile First**.
La consigna está pensada para reforzar:

- diferencias entre Flexbox y Grid;
- construcción de layouts de dos dimensiones;
- uso de `@media` para escalar de mobile a desktop.

## Diseño de referencia

- Figma: [InstaFront - Grid](https://www.figma.com/design/YqfGFRraT4CFtNI704vZJl/InstaFront---Grid?node-id=0-1&t=hdlLU64TozR2CKZC-1)

## Estructura esperada del repositorio

Debés trabajar respetando esta estructura base:

- `index.html`
- `css/style.css`
- `img/` (recursos de imágenes)

## Requisitos mínimos (autoevaluables)

Los checks automáticos de GitHub Classroom validan estos puntos:

1. Existe `index.html`, la carpeta `css/` y la carpeta `img/`.
2. Existe `css/style.css` y está enlazado desde el HTML.
3. Hay al menos una regla con `display: grid`.
4. Hay al menos una regla con `grid-template-columns`.
5. Hay al menos una `@media` con `min-width` (enfoque Mobile First).
6. En una `@media` con `min-width`, se redefine la grilla para desktop usando `grid-template-columns`.

## Requisitos de revisión docente (no automáticos)

Además de los checks, se revisará:

- fidelidad visual general respecto al Figma;
- uso correcto de Grid para distribuir las piezas;
- legibilidad del código (indentación, nombres, organización);
- consistencia responsive entre vista mobile y desktop.

## Recomendación de flujo de trabajo

1. Cloná tu repositorio de Classroom.
2. Hacé un primer commit con estructura y enlace de CSS.
3. Implementá layout mobile.
4. Agregá media query para desktop.
5. Verificá en GitHub la pestaña **Actions/Checks**.
6. Iterá hasta tener todos los checks en verde.

## Cómo correr una autoverificación local

Podés ejecutar las mismas pruebas del aula con:

```bash
bash scripts/classroom-check.sh all
```

O una prueba puntual:

```bash
bash scripts/classroom-check.sh grid-template
```

## Entrega

- Hacé `push` a `main` (o `master`) antes del cierre.
- Asegurate de tener los checks automáticos aprobados.
- Recordá: checks en verde **no reemplazan** la corrección docente final.