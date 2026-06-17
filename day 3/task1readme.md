# Multi-screen Quiz App 🧠

Ky është një aplikacion Quiz-i me disa ekrane i zhvilluar në Flutter për **Ditën 3** të praktikës sime të brendshme (Internal Internship). Aplikacioni demonstron menaxhimin e gjendjes dinamike (`setState`) dhe lëvizjen midis ekraneve me anë të `Navigator`.

##  Çfarë funksionon (Kërkesat e realizuara)

- **Model Classes:** Krijimi i strukturave të të dhënave në Dart (`Question` dhe `Answer`) për organizim të pastër.
- **State Management (`setState`):** Përditësimi dinamik i pyetjes aktuale dhe llogaritja e pikëve në kohë reale.
- **Navigimi i Ekraneve:** Kalimi automatik te ekrani i rezultatit përmes `Navigator.push` pas pyetjes së fundit.
- **Rifillimi i Quiz-it:** Mundësia për të fshirë pikët dhe për t'u kthyer në fillim përmes `Navigator.pop`.
- **UI Interaktive:** Të paktën 5 pyetje me nga 4 opsione secila, të gjeneruara në mënyrë dinamike me `.map()`.

##  Teknologjitë e përdorura

- **Flutter & Dart** (Logjika bazë e bazuar në parimet e marra nga java e parë në C).
- **Material Design Widgets** (`StatefulWidget`, `ElevatedButton`, `Navigator`, etc.).

##  Si mbetet për t'u shtuar (Bonus & Përmirësime në të ardhmen)

-  Integrimi i një API për të marrë pyetje live nga interneti.
- Ruajtja e pikëve maksimale duke përdorur Local Storage (`shared_preferences`).
-  Shtimi i një kohëmatësi (Timer) për çdo pyetje për ta bërë kuizin më sfidues.
-  UI akoma më responsive për ekranet e mëdha të Desktop-it.

##  Pamje nga Aplikacioni (Screenshots)

1. Ekrani i Pyetjeve <img width="367" height="645" alt="Screenshot 2026-06-17 100909" src="https://github.com/user-attachments/assets/06dac089-05a2-4459-9e5c-251a0867fdc5" />
2. Ekrani i Rezultateve <img width="342" height="624" alt="Screenshot 2026-06-17 100940" src="https://github.com/user-attachments/assets/def3ad91-5222-4d06-86fa-e654accb6968" />

---
