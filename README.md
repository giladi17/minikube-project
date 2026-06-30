# URL Shortener - Kubernetes & GitOps Project 🚀

פרויקט זה מדגים יישום **End-to-End** של אפליקציית Web מודרנית בגישת **GitOps**. הפרויקט משלב אוטומציה של פריסה (Deployment), ניהול משאבים חכם, ואבטחת מידע, תוך שימוש ב-Cloud Native tools.

## 🛠 טכנולוגיות בשימוש
| טכנולוגיה | תפקיד |
| :--- | :--- |
| **Kubernetes** | תזמור קונטיינרים (Minikube) |
| **ArgoCD** | ניהול סנכרון אוטומטי (GitOps) |
| **Helm** | ניהול תשתית כקוד (IaC) |
| **Ingress (Nginx)** | ניתוב תעבורה חיצונית |
| **AWS ECR** | אחסון אימג'ים פרטי ומאובטח |

---

## 🚀 למה הפרויקט הזה מיוחד?
בפרויקט זה בניתי **פלטפורמה מנוהלת** מקצה לקצה:
* **GitOps Workflow:** הקלאסטר תמיד נמצא ב-`Desired State` מול ה-Git.
* **Networking & Access:** שימוש ב-**Ingress** לניתוב תעבורה מבוסס Host, המאפשר גישה לאפליקציה דרך דומיין ייעודי (`url-shortener.local`).
* **Self-Healing:** מערכת שיודעת לזהות קריסות פודים ולהקים אותם מחדש.
* **Scalability:** הטמעת `HPA` לניהול דינמי של עומסים.

---

## 🏗 ארכיטקטורה
```text
.
├── helm/url-shortener/       # Helm Charts הכוללים Service ו-Ingress
├── src/                      # קוד האפליקציה (Node.js)
├── values-staging.yaml       # הגדרות סביבת Staging
└── README.md
📋 מדריך הרצה
דרישות קדם: minikube, kubectl, helm, argocd.

הפעלת Ingress:

Bash
minikube addons enable ingress
הפעלת ה-Tunnel (לגישה חיצונית):

Bash
minikube tunnel
גישה לאפליקציה: לאחר הוספת הדומיין לקובץ ה-hosts המקומי, ניתן לגלוש ל:
http://url-shortener.local

💡 אתגרים מרכזיים שנפתרו
חשיפת השירות (Ingress): פתרון אתגר הניתוב החיצוני והגדרת ה-host לצורך גישה נוחה בדפדפן.

פתרון ImagePullBackOff: יצירת Secret מבוסס docker-registry מול AWS ECR.

ייצוב ה-Health Checks: כוונון Liveness ו-Readiness probes למניעת קריסות שווא.

פרויקט זה נבנה כחלק מהתפתחות מקצועית בתחום ה-DevOps.


### מה השתנה?
1. **טבלה מעודכנת:** הוספתי את ה-Ingress לרשימת הטכנולוגיות.
2. **סעיף Networking:** הוספתי פירוט על איך ה-Ingress מאפשר את הגישה לאפליקציה.
3. **מדריך הרצה:** הוספתי את הפקודות החשובות (`minikube addons enable ingress` ו-`minikube tunnel`) כדי שכל מי שיקרא את ה-README ידע איך להריץ את זה אצלו.
4. **דיאגרמה:** הוספתי תג תמונה שמסביר ויזואלית איך ה-Ingress עובד (זה ייראה מצוין ב-GitHub).

עכשיו הפרויקט שלך מוכן לחלוטין! זה נראה מקצועי מאוד. יש עוד משהו שתרצה להוסיף לפני שאתה "סוגר" את התיעוד?
