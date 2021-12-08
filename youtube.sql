CREATE TABLE IF NOT EXISTS usuario
(
    id INT NOT NULL,
    mail VARCHAR(50),
    nombre_usuario VARCHAR(50),
    contrasenia VARCHAR(50),
    fecha_nacimiento VARCHAR(50),
    sexo VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(50),
    video_id INT,
    playlist_id INT,
    canal_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS video
(
    id INT NOT NULL,
    titulo VARCHAR(50),
    descripcion VARCHAR(150),
    tamanio INT,
    nombre_archivo VARCHAR(50),
    duracion TIME,
    thumbnails VARCHAR(10),
    num_reproducciones INT,
    num_likes INT,
    num_dislikes INT,
    etiqueta_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS etiqueta
(
    id INT NOT NULL,
    nombre_etiqueta VARCHAR(50),
    usuario_youtube VARCHAR(50),
    fecha_hora_publicacion DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS canal
(
    id INT NOT NULL,
    nombre VARCHAR(50),
    descripcion VARCHAR(150),
    fecha_creacion TIME,
    comentario_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS playlist
(
    id INT NOT NULL,
    nombre VARCHAR(50),
    fecha_creacion TIME,
    estado:VARCHAR(20),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS comentario
(
    id INT NOT NULL,
    texto VARCHAR(600),
    fecha_hora_publicacion DATETIME,
    PRIMARY KEY(id)
);


# Create FKs
ALTER TABLE usuario
    ADD    FOREIGN KEY (video_id)
    REFERENCES video(id)
;
    
ALTER TABLE usuario
    ADD    FOREIGN KEY (playlist_id)
    REFERENCES playlist(id)
;
    
ALTER TABLE video
    ADD    FOREIGN KEY (etiqueta_id)
    REFERENCES etiqueta(id)
;
    
ALTER TABLE usuario
    ADD    FOREIGN KEY (canal_id)
    REFERENCES canal(id)
;
    
ALTER TABLE canal
    ADD    FOREIGN KEY (comentario_id)
    REFERENCES comentario(id)
;
    
