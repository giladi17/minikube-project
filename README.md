# URL Shortener - Kubernetes & GitOps Project 🚀

פרויקט זה מדגים יישום **End-to-End** של אפליקציית Web מודרנית בגישת **GitOps**. הפרויקט משלב אוטומציה של פריסה (Deployment), ניהול משאבים חכם, ואבטחת מידע, תוך שימוש ב-Cloud Native tools.

## 🛠 טכנולוגיות בשימוש
| טכנולוגיה | תפקיד |
| :--- | :--- |
| **Kubernetes** | תזמור קונטיינרים (Minikube) |
| **ArgoCD** | ניהול סנכרון אוטומטי (GitOps) |
| **Helm** | ניהול תשתית כקוד (IaC) |
| **AWS ECR** | אחסון אימג'ים פרטי ומאובטח |
| **Node.js/Express** | פיתוח האפליקציה |

---

## 🚀 למה הפרויקט הזה מיוחד?
בפרויקט זה בניתי **פלטפורמה מנוהלת** מקצה לקצה:
* **GitOps Workflow:** הקלאסטר תמיד נמצא ב-`Desired State` מול ה-Git. שינוי בגיט = שינוי בקלאסטר.
* **Self-Healing:** בזכות ArgoCD וה-Probes שהגדרתי, המערכת מזהה קריסות של פודים ומקימה אותם מחדש.
* **Troubleshooting:** התמודדות עם אתגרים מורכבים כמו הרשאות Registry פרטי (`ImagePullSecrets`) ותקשורת רשת בין קונטיינרים.
* **Scalability:** שימוש ב-`HPA` לניהול דינמי של משאבי מערכת.

---

## 🏗 ארכיטקטורה
הפרויקט בנוי בצורה מודולרית המפרידה בין לוגיקה לקונפיגורציה:
```text
.
├── helm/url-shortener/       # Helm Charts לניהול התשתית
├── src/                      # קוד האפליקציה (Node.js)
├── values-staging.yaml       # קונפיגורציה ייעודית לסביבת Staging
└── README.md
📋 מדריך הרצה
דרישות קדם: התקן minikube, kubectl, helm ו-argocd.

הקמת הסביבה:

Bash
minikube start
kubectl apply -n argocd -f [https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)
חיבור ל-Git: הוסף את ה-Repository שלך ל-ArgoCD והפעל סנכרון (Sync).

💡 אתגרים מרכזיים שנפתרו
פתרון ImagePullBackOff: יצירת Secret מבוסס docker-registry ועדכון הרשאות AWS מול ה-K8s Cluster.

ייצוב ה-Health Checks: כוונון מדויק של Liveness ו-Readiness probes כדי למנוע קריסות שווא.

ניקוי טכני: הסרת ReplicaSets ישנים ושאריות אובייקטים לטובת סביבה נקייה ויציבה.

פרויקט זה נבנה כחלק מהתפתחות מקצועית בתחום ה-DevOps.
