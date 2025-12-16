-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/12/2025 às 15:44
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL COMMENT 'Ex: Segunda e Quarta 18h-20h',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `max_students` int(11) DEFAULT 20,
  `status` enum('active','inactive','completed') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `classes`
--

INSERT INTO `classes` (`id`, `course_id`, `name`, `schedule`, `start_date`, `end_date`, `max_students`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Turma A - Informática Básica', 'Segunda e Quarta 18h-20h', '2025-02-01', NULL, 15, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(2, 2, 'Turma B - Programação Web', 'Terça e Quinta 19h-21h', '2025-02-05', NULL, 20, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(3, 3, 'Turma C - Design Gráfico', 'Sábado 8h-12h', '2025-02-10', NULL, 12, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(4, 4, 'Turma D - Excel Avançado', 'Segunda e Quarta 14h-16h', '2025-03-01', NULL, 18, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` varchar(50) NOT NULL COMMENT 'Ex: 3 meses, 6 meses',
  `price` decimal(10,2) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `duration`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Informática Básica', 'Windows, Word, Excel, PowerPoint e Internet', '2 meses', 250.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(2, 'Programação Web', 'HTML, CSS, JavaScript, React e Node.js', '6 meses', 450.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(3, 'Design Gráfico', 'Photoshop, Illustrator, CorelDRAW e Figma', '4 meses', 350.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(4, 'Excel Avançado', 'Fórmulas, tabelas dinâmicas, macros e VBA', '3 meses', 300.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(5, 'Marketing Digital', 'Redes sociais, anúncios e estratégias online', '3 meses', 320.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(6, 'Manutenção de Computadores', 'Hardware, software, redes e troubleshooting', '4 meses', 380.00, 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(7, 'Nome do Curso', 'Descrição do curso', '3 meses', 350.00, 'active', '2025-12-16 14:36:28', '2025-12-16 14:36:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` enum('active','completed','canceled') DEFAULT 'active',
  `grade` decimal(5,2) DEFAULT NULL COMMENT 'Nota final',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `class_id`, `enrollment_date`, `status`, `grade`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-01-10', 'active', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(2, 2, 2, '2025-01-12', 'active', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(3, 3, 1, '2025-02-01', 'active', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(4, 4, 3, '2024-12-15', 'active', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enrollment_requests`
--

CREATE TABLE `enrollment_requests` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `education` varchar(100) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `payment_day` varchar(2) NOT NULL,
  `class_days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Dias e horários escolhidos' CHECK (json_valid(`class_days`)),
  `social_media` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `enrollment_requests`
--

INSERT INTO `enrollment_requests` (`id`, `student_name`, `birth_date`, `cpf`, `address`, `email`, `phone`, `education`, `marital_status`, `payment_day`, `class_days`, `social_media`, `status`, `created_at`, `updated_at`) VALUES
(1, 'EDILSON JOSE DOS SANTOS', '1978-10-22', '03924705437', 'POV. QUITUNDE NA PRINCIPAL SN - PROXIMO A IGREJA BATISTA (São Luis do Quitunde-AL)', 'edilsonadds@gmail.com', '82993263731', 'Superior Incompleto', 'Casado(a)', '20', '{\"Segunda-feira\":\"08:00h \\u00e0s 09:00h\",\"Ter\\u00e7a-feira\":\"08:00h \\u00e0s 09:00h\"}', '', 'approved', '2025-12-16 14:26:15', '2025-12-16 14:36:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('pending','paid','overdue','canceled') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL COMMENT 'PIX, Dinheiro, Cartão',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `payments`
--

INSERT INTO `payments` (`id`, `student_id`, `enrollment_id`, `amount`, `due_date`, `payment_date`, `status`, `payment_method`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 250.00, '2025-02-05', '2025-12-16', 'paid', 'PIX', NULL, '2025-12-16 13:51:15', '2025-12-16 14:36:28'),
(2, 1, 1, 250.00, '2025-03-05', NULL, 'pending', NULL, NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(3, 2, 2, 450.00, '2025-02-10', '2025-02-09', 'paid', 'PIX', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(4, 2, 2, 450.00, '2025-03-10', NULL, 'pending', NULL, NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(5, 3, 3, 250.00, '2025-02-05', NULL, 'overdue', NULL, NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(6, 4, 4, 350.00, '2025-01-15', '2025-01-14', 'paid', 'Dinheiro', NULL, '2025-12-16 13:51:15', '2025-12-16 13:51:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `address` text DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `enrollment_date` date NOT NULL,
  `enrollment_code` varchar(20) DEFAULT NULL COMMENT 'Código de matrícula do aluno',
  `status` enum('active','inactive','completed','dropout') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `cpf`, `address`, `birth_date`, `enrollment_date`, `enrollment_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '(82) 99999-0001', '123.456.789-00', 'Rua A, 123, Maceió-AL', '1995-05-15', '2025-01-10', '2025001', 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(2, 'Maria Santos', 'maria.santos@email.com', '(82) 99999-0002', '123.456.789-01', 'Rua B, 456, Maceió-AL', '1998-08-20', '2025-01-12', '2025002', 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(3, 'Pedro Costa', 'pedro.costa@email.com', '(82) 99999-0003', '123.456.789-02', 'Rua C, 789, Maceió-AL', '2000-03-10', '2025-02-01', '2025003', 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(4, 'Ana Oliveira', 'ana.oliveira@email.com', '(82) 99999-0004', '123.456.789-03', 'Rua D, 321, Maceió-AL', '1997-11-25', '2024-12-15', '2024150', 'active', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(5, 'Carlos Pereira', 'carlos.pereira@email.com', '(82) 99999-0005', '123.456.789-04', 'Rua E, 654, Maceió-AL', '1999-07-08', '2024-11-20', '2024120', 'completed', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(6, 'Juliana Almeida', 'juliana.almeida@email.com', '(82) 99999-0006', '123.456.789-05', 'Rua F, 987, Maceió-AL', '2001-02-14', '2024-10-05', '2024105', 'dropout', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(7, 'Roberto Fernandes', 'roberto.fernandes@email.com', '(82) 99999-0007', '123.456.789-06', 'Rua G, 147, Maceió-AL', '1996-09-30', '2024-09-01', '2024090', 'inactive', '2025-12-16 13:51:15', '2025-12-16 13:51:15'),
(8, 'Seu Nome Aqui', 'seuemail@exemplo.com', '(82) 99999-9999', '000.000.000-00', 'Seu Endereço', '1990-01-01', '2025-12-16', '2025010', 'active', '2025-12-16 14:36:27', '2025-12-16 14:36:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `study_materials`
--

CREATE TABLE `study_materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_type` varchar(50) NOT NULL COMMENT 'PDF, Video, Excel, etc',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `idx_status` (`status`);

--
-- Índices de tabela `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`);

--
-- Índices de tabela `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`class_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `idx_status` (`status`);

--
-- Índices de tabela `enrollment_requests`
--
ALTER TABLE `enrollment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_email` (`email`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_due_date` (`due_date`);

--
-- Índices de tabela `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollment_code` (`enrollment_code`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_cpf` (`cpf`),
  ADD KEY `idx_enrollment_code` (`enrollment_code`),
  ADD KEY `idx_status` (`status`);

--
-- Índices de tabela `study_materials`
--
ALTER TABLE `study_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `enrollment_requests`
--
ALTER TABLE `enrollment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `study_materials`
--
ALTER TABLE `study_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `study_materials`
--
ALTER TABLE `study_materials`
  ADD CONSTRAINT `study_materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
