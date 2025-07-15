# Teams BLoC 🏆

**Languages:** [🇺🇸 English](#english) | [🇧🇷 Português](#português)

---

## English

### 📋 Project Description

**Teams BLoC** is a Flutter mobile application designed for team management and organization. The app allows users to create classes or groups and divide participants into two balanced teams (Team A and Team B). It's perfect for sports activities, educational group work, games, or any scenario where you need to organize people into teams quickly and efficiently.

### 🛠️ Technologies and Tools

- **Flutter** 🐦 - Cross-platform mobile development framework
- **Dart** 🎯 - Programming language
- **BLoC Pattern** 🔄 - State management architecture
- **Hive** 📦 - Local NoSQL database for data persistence
- **flutter_modular** 🧩 - Dependency injection and routing
- **Google Fonts** 🔤 - Custom typography
- **Material 3** 🎨 - Modern design system

### 🏗️ Project Architecture

The application follows a clean architecture approach with the BLoC pattern:

```
lib/
├── core/
│   ├── database/       # Hive database configuration
│   ├── models/         # Data models (ClassModel, ParticipantModel)
│   └── styles/         # App colors and themes
├── src/
│   ├── bloc/           # Business logic components
│   │   ├── classes/    # Classes BLoC (state management)
│   │   └── participants/ # Participants BLoC
│   ├── pages/          # UI screens
│   │   ├── home_page.dart
│   │   ├── add_class_page.dart
│   │   └── info_class_page.dart
│   └── repository/     # Data access layer
└── main.dart           # App entry point
```

**Architecture Components:**
- **BLoC (Business Logic Component)**: Manages app state and business logic
- **Repository Pattern**: Handles data access and persistence
- **Models**: Define data structures with Hive annotations
- **Pages**: UI components that respond to state changes
- **Dependency Injection**: Managed by flutter_modular

### 🚀 How to Run the Project Locally

#### Prerequisites
- Flutter SDK (>=3.0.6)
- Dart SDK
- Android Studio or VS Code
- Android/iOS emulator or physical device

#### Steps

1. **Clone the repository:**
```bash
git clone https://github.com/IagoAntunes/teamsBloc.git
cd teamsBloc
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Generate Hive type adapters:**
```bash
flutter packages pub run build_runner build
```

4. **Run the application:**
```bash
flutter run
```

#### Additional Commands

- **Build for Android:**
```bash
flutter build apk
```

- **Build for iOS:**
```bash
flutter build ios
```

- **Run tests:**
```bash
flutter test
```

### 📱 Features

- ✅ Create and manage classes/groups
- ✅ Add participants to classes
- ✅ Automatically divide participants into balanced teams
- ✅ Local data persistence with Hive
- ✅ Modern Material 3 design
- ✅ Responsive UI

---

## Português

### 📋 Descrição do Projeto

**Teams BLoC** é uma aplicação mobile Flutter projetada para gerenciamento e organização de equipes. O aplicativo permite aos usuários criar turmas ou grupos e dividir os participantes em duas equipes equilibradas (Time A e Time B). É perfeito para atividades esportivas, trabalhos educacionais em grupo, jogos ou qualquer cenário onde você precisa organizar pessoas em equipes de forma rápida e eficiente.

### 🛠️ Tecnologias e Ferramentas

- **Flutter** 🐦 - Framework de desenvolvimento mobile multiplataforma
- **Dart** 🎯 - Linguagem de programação
- **Padrão BLoC** 🔄 - Arquitetura de gerenciamento de estado
- **Hive** 📦 - Banco de dados NoSQL local para persistência de dados
- **flutter_modular** 🧩 - Injeção de dependência e roteamento
- **Google Fonts** 🔤 - Tipografia personalizada
- **Material 3** 🎨 - Sistema de design moderno

### 🏗️ Arquitetura do Projeto

A aplicação segue uma abordagem de arquitetura limpa com o padrão BLoC:

```
lib/
├── core/
│   ├── database/       # Configuração do banco Hive
│   ├── models/         # Modelos de dados (ClassModel, ParticipantModel)
│   └── styles/         # Cores e temas do app
├── src/
│   ├── bloc/           # Componentes de lógica de negócio
│   │   ├── classes/    # BLoC de turmas (gerenciamento de estado)
│   │   └── participants/ # BLoC de participantes
│   ├── pages/          # Telas da interface
│   │   ├── home_page.dart
│   │   ├── add_class_page.dart
│   │   └── info_class_page.dart
│   └── repository/     # Camada de acesso aos dados
└── main.dart           # Ponto de entrada do app
```

**Componentes da Arquitetura:**
- **BLoC (Business Logic Component)**: Gerencia o estado e lógica de negócio do app
- **Padrão Repository**: Lida com acesso e persistência de dados
- **Models**: Definem estruturas de dados com anotações Hive
- **Pages**: Componentes de UI que respondem a mudanças de estado
- **Injeção de Dependência**: Gerenciada pelo flutter_modular

### 🚀 Como Executar o Projeto Localmente

#### Pré-requisitos
- Flutter SDK (>=3.0.6)
- Dart SDK
- Android Studio ou VS Code
- Emulador Android/iOS ou dispositivo físico

#### Passos

1. **Clone o repositório:**
```bash
git clone https://github.com/IagoAntunes/teamsBloc.git
cd teamsBloc
```

2. **Instale as dependências:**
```bash
flutter pub get
```

3. **Gere os adaptadores de tipo do Hive:**
```bash
flutter packages pub run build_runner build
```

4. **Execute a aplicação:**
```bash
flutter run
```

#### Comandos Adicionais

- **Build para Android:**
```bash
flutter build apk
```

- **Build para iOS:**
```bash
flutter build ios
```

- **Executar testes:**
```bash
flutter test
```

### 📱 Funcionalidades

- ✅ Criar e gerenciar turmas/grupos
- ✅ Adicionar participantes às turmas
- ✅ Dividir automaticamente participantes em equipes equilibradas
- ✅ Persistência de dados local com Hive
- ✅ Design moderno Material 3
- ✅ Interface responsiva

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Developer

**Iago Antunes** - [GitHub Profile](https://github.com/IagoAntunes)
