PGDMP      0            	    |           SRSO3    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16863    SRSO3    DATABASE     �   CREATE DATABASE "SRSO3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SRSO3";
                postgres    false            �            1259    16875 	   criterios    TABLE     �   CREATE TABLE public.criterios (
    id_criterio integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);
    DROP TABLE public.criterios;
       public         heap    postgres    false            �            1259    16874    criterios_id_criterio_seq    SEQUENCE     �   CREATE SEQUENCE public.criterios_id_criterio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.criterios_id_criterio_seq;
       public          postgres    false    218            �           0    0    criterios_id_criterio_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.criterios_id_criterio_seq OWNED BY public.criterios.id_criterio;
          public          postgres    false    217            �            1259    16884    criterios_sistemas    TABLE     �   CREATE TABLE public.criterios_sistemas (
    id_criterio_sistema integer NOT NULL,
    id_criterio integer NOT NULL,
    id_sistema integer NOT NULL,
    valor character varying(100) NOT NULL
);
 &   DROP TABLE public.criterios_sistemas;
       public         heap    postgres    false            �            1259    16883 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE     �   CREATE SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq;
       public          postgres    false    220            �           0    0 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq OWNED BY public.criterios_sistemas.id_criterio_sistema;
          public          postgres    false    219            �            1259    16865    sistemas_operativos    TABLE     �  CREATE TABLE public.sistemas_operativos (
    id_sistema integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    fabricante character varying(100),
    tipo character varying(10) NOT NULL,
    fecha_lanzamiento date,
    CONSTRAINT sistemas_operativos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Desktop'::character varying, 'Server'::character varying, 'Mobile'::character varying, 'Embedded'::character varying])::text[])))
);
 '   DROP TABLE public.sistemas_operativos;
       public         heap    postgres    false            �            1259    16864 "   sistemas_operativos_id_sistema_seq    SEQUENCE     �   CREATE SEQUENCE public.sistemas_operativos_id_sistema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.sistemas_operativos_id_sistema_seq;
       public          postgres    false    216            �           0    0 "   sistemas_operativos_id_sistema_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.sistemas_operativos_id_sistema_seq OWNED BY public.sistemas_operativos.id_sistema;
          public          postgres    false    215            %           2604    16878    criterios id_criterio    DEFAULT     ~   ALTER TABLE ONLY public.criterios ALTER COLUMN id_criterio SET DEFAULT nextval('public.criterios_id_criterio_seq'::regclass);
 D   ALTER TABLE public.criterios ALTER COLUMN id_criterio DROP DEFAULT;
       public          postgres    false    218    217    218            &           2604    16887 &   criterios_sistemas id_criterio_sistema    DEFAULT     �   ALTER TABLE ONLY public.criterios_sistemas ALTER COLUMN id_criterio_sistema SET DEFAULT nextval('public.criterios_sistemas_id_criterio_sistema_seq'::regclass);
 U   ALTER TABLE public.criterios_sistemas ALTER COLUMN id_criterio_sistema DROP DEFAULT;
       public          postgres    false    219    220    220            $           2604    16868    sistemas_operativos id_sistema    DEFAULT     �   ALTER TABLE ONLY public.sistemas_operativos ALTER COLUMN id_sistema SET DEFAULT nextval('public.sistemas_operativos_id_sistema_seq'::regclass);
 M   ALTER TABLE public.sistemas_operativos ALTER COLUMN id_sistema DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16875 	   criterios 
   TABLE DATA           E   COPY public.criterios (id_criterio, nombre, descripcion) FROM stdin;
    public          postgres    false    218   F"       �          0    16884    criterios_sistemas 
   TABLE DATA           a   COPY public.criterios_sistemas (id_criterio_sistema, id_criterio, id_sistema, valor) FROM stdin;
    public          postgres    false    220   �"       �          0    16865    sistemas_operativos 
   TABLE DATA           s   COPY public.sistemas_operativos (id_sistema, nombre, descripcion, fabricante, tipo, fecha_lanzamiento) FROM stdin;
    public          postgres    false    216   6#       �           0    0    criterios_id_criterio_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.criterios_id_criterio_seq', 4, true);
          public          postgres    false    217            �           0    0 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.criterios_sistemas_id_criterio_sistema_seq', 6, true);
          public          postgres    false    219            �           0    0 "   sistemas_operativos_id_sistema_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.sistemas_operativos_id_sistema_seq', 3, true);
          public          postgres    false    215            +           2606    16882    criterios criterios_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.criterios
    ADD CONSTRAINT criterios_pkey PRIMARY KEY (id_criterio);
 B   ALTER TABLE ONLY public.criterios DROP CONSTRAINT criterios_pkey;
       public            postgres    false    218            -           2606    16889 *   criterios_sistemas criterios_sistemas_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_pkey PRIMARY KEY (id_criterio_sistema);
 T   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_pkey;
       public            postgres    false    220            )           2606    16873 ,   sistemas_operativos sistemas_operativos_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.sistemas_operativos
    ADD CONSTRAINT sistemas_operativos_pkey PRIMARY KEY (id_sistema);
 V   ALTER TABLE ONLY public.sistemas_operativos DROP CONSTRAINT sistemas_operativos_pkey;
       public            postgres    false    216            .           2606    16890 6   criterios_sistemas criterios_sistemas_id_criterio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_id_criterio_fkey FOREIGN KEY (id_criterio) REFERENCES public.criterios(id_criterio);
 `   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_id_criterio_fkey;
       public          postgres    false    220    4651    218            /           2606    16895 5   criterios_sistemas criterios_sistemas_id_sistema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES public.sistemas_operativos(id_sistema);
 _   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_id_sistema_fkey;
       public          postgres    false    4649    220    216            �   �   x�u�=�0F��>?7@]`e1��,%q��z$N���������z~ޛ�Ca��\x� �@��� �Z)"H���G�s��92�*+V�r<������Y��I�Eta&�ءcI��d�'��p��%*��Uۺ]J:ğh�߸��}g���qZf      �   7   x�3�4B�Ԕ�D.#N# �1�$���0�0M8A��@ac��Pʌ���� '��      �   �   x�m��jA����S�FfGE<ׂ�Xċ��N
�mfIf���#�ź�=����N,�|4����B�I��@&�s���{u�kC�QK�Rl�!�BZ��� u�gq1jy�ۡ㟛LԎe�B���6�2�{A)�~�qSq���݁2l�«T�^�����=*��^8%�f��ro�t�_�8����{�mWq     