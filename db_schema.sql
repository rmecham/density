--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO density;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO density;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO density;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO density;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO density;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO density;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO density;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO density;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO density;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO density;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO density;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO density;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO density;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO density;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO density;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO density;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO density;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: density
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO density;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: density
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO density;

--
-- Name: dpu_doorway; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.dpu_doorway (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.dpu_doorway OWNER TO density;

--
-- Name: dpu_dpu; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.dpu_dpu (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    dpu_id integer NOT NULL,
    doorway_id uuid,
    entry_space_id uuid,
    exit_space_id uuid,
    CONSTRAINT dpu_dpu_dpu_id_check CHECK ((dpu_id >= 0))
);


ALTER TABLE public.dpu_dpu OWNER TO density;

--
-- Name: dpu_dpuevent; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.dpu_dpuevent (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    direction smallint NOT NULL,
    dpu_id uuid NOT NULL
);


ALTER TABLE public.dpu_dpuevent OWNER TO density;

--
-- Name: dpu_space; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.dpu_space (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.dpu_space OWNER TO density;

--
-- Name: dpu_spaceoccupancy; Type: TABLE; Schema: public; Owner: density
--

CREATE TABLE public.dpu_spaceoccupancy (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status character varying(30) NOT NULL,
    occupancy integer NOT NULL,
    dpu_event_id uuid NOT NULL,
    space_id uuid NOT NULL
);


ALTER TABLE public.dpu_spaceoccupancy OWNER TO density;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: dpu_doorway dpu_doorway_name_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_doorway
    ADD CONSTRAINT dpu_doorway_name_key UNIQUE (name);


--
-- Name: dpu_doorway dpu_doorway_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_doorway
    ADD CONSTRAINT dpu_doorway_pkey PRIMARY KEY (id);


--
-- Name: dpu_dpu dpu_dpu_doorway_id_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_doorway_id_key UNIQUE (doorway_id);


--
-- Name: dpu_dpu dpu_dpu_dpu_id_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_dpu_id_key UNIQUE (dpu_id);


--
-- Name: dpu_dpu dpu_dpu_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_pkey PRIMARY KEY (id);


--
-- Name: dpu_dpuevent dpu_dpuevent_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpuevent
    ADD CONSTRAINT dpu_dpuevent_pkey PRIMARY KEY (id);


--
-- Name: dpu_space dpu_space_name_key; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_space
    ADD CONSTRAINT dpu_space_name_key UNIQUE (name);


--
-- Name: dpu_space dpu_space_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_space
    ADD CONSTRAINT dpu_space_pkey PRIMARY KEY (id);


--
-- Name: dpu_spaceoccupancy dpu_spaceoccupancy_pkey; Type: CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_spaceoccupancy
    ADD CONSTRAINT dpu_spaceoccupancy_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: dpu_doorway_name_ae9c6cee_like; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_doorway_name_ae9c6cee_like ON public.dpu_doorway USING btree (name varchar_pattern_ops);


--
-- Name: dpu_dpu_entry_space_id_7a0472db; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_dpu_entry_space_id_7a0472db ON public.dpu_dpu USING btree (entry_space_id);


--
-- Name: dpu_dpu_exit_space_id_c14ed78f; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_dpu_exit_space_id_c14ed78f ON public.dpu_dpu USING btree (exit_space_id);


--
-- Name: dpu_dpuevent_dpu_id_5836a78f; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_dpuevent_dpu_id_5836a78f ON public.dpu_dpuevent USING btree (dpu_id);


--
-- Name: dpu_dpuevent_timestamp_53322000; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_dpuevent_timestamp_53322000 ON public.dpu_dpuevent USING btree ("timestamp");


--
-- Name: dpu_space_name_f5dc9a94_like; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_space_name_f5dc9a94_like ON public.dpu_space USING btree (name varchar_pattern_ops);


--
-- Name: dpu_spaceoccupancy_dpu_event_id_e93ba269; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_spaceoccupancy_dpu_event_id_e93ba269 ON public.dpu_spaceoccupancy USING btree (dpu_event_id);


--
-- Name: dpu_spaceoccupancy_space_id_4b8a290a; Type: INDEX; Schema: public; Owner: density
--

CREATE INDEX dpu_spaceoccupancy_space_id_4b8a290a ON public.dpu_spaceoccupancy USING btree (space_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_dpu dpu_dpu_doorway_id_3d231bb5_fk_dpu_doorway_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_doorway_id_3d231bb5_fk_dpu_doorway_id FOREIGN KEY (doorway_id) REFERENCES public.dpu_doorway(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_dpu dpu_dpu_entry_space_id_7a0472db_fk_dpu_space_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_entry_space_id_7a0472db_fk_dpu_space_id FOREIGN KEY (entry_space_id) REFERENCES public.dpu_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_dpu dpu_dpu_exit_space_id_c14ed78f_fk_dpu_space_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpu
    ADD CONSTRAINT dpu_dpu_exit_space_id_c14ed78f_fk_dpu_space_id FOREIGN KEY (exit_space_id) REFERENCES public.dpu_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_dpuevent dpu_dpuevent_dpu_id_5836a78f_fk_dpu_dpu_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_dpuevent
    ADD CONSTRAINT dpu_dpuevent_dpu_id_5836a78f_fk_dpu_dpu_id FOREIGN KEY (dpu_id) REFERENCES public.dpu_dpu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_spaceoccupancy dpu_spaceoccupancy_dpu_event_id_e93ba269_fk_dpu_dpuevent_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_spaceoccupancy
    ADD CONSTRAINT dpu_spaceoccupancy_dpu_event_id_e93ba269_fk_dpu_dpuevent_id FOREIGN KEY (dpu_event_id) REFERENCES public.dpu_dpuevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dpu_spaceoccupancy dpu_spaceoccupancy_space_id_4b8a290a_fk_dpu_space_id; Type: FK CONSTRAINT; Schema: public; Owner: density
--

ALTER TABLE ONLY public.dpu_spaceoccupancy
    ADD CONSTRAINT dpu_spaceoccupancy_space_id_4b8a290a_fk_dpu_space_id FOREIGN KEY (space_id) REFERENCES public.dpu_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

