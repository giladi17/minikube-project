URL Shortener - Kubernetes & GitOps Project
פרויקט זה מדגים יישום End-to-End של אפליקציית Web מודרנית בגישת GitOps. הפרויקט משלב אוטומציה של פריסה (Deployment), ניהול משאבים חכם, ואבטחת מידע, תוך שימוש ב-Cloud Native tools.

🛠 טכנולוגיות בשימוש
Orchestration: Kubernetes (Minikube).

GitOps: ArgoCD – לניהול סנכרון אוטומטי בין ה-Repository לקלאסטר.

IaC: Helm Charts – לניהול הגדרות התשתית.

CI/CD: אוטומציה של עדכון אימג'ים (ECR) וסנכרון מול ה-Git.

Security: ניהול הרשאות מאובטח מול AWS ECR באמצעות imagePullSecrets.

Reliability: הגדרת Probes (Liveness/Readiness) ו-Resource Quotas ליציבות מקסימלית.

🚀 למה הפרויקט הזה מיוחד?
בפרויקט זה לא רק "הרמנו אפליקציה", אלא בנינו פלטפורמה:

GitOps Workflow: הקלאסטר תמיד נמצא במצב רצוי (Desired State) מול ה-Git.

Self-Healing: בזכות ArgoCD וה-Probes שהגדרתי, המערכת יודעת לתקן את עצמה אם פוד קורס או נמחק.

Troubleshooting: במהלך הפיתוח התמודדתי ופתרתי אתגרים מורכבים כמו הרשאות מול Registry פרטי ובעיות תקשורת בין הקונטיינר לקוברנטיס.

🏗 ארכיטקטורה
הפרויקט בנוי בצורה מודולרית:

helm/url-shortener/: מכיל את כל ה-Templates של האפליקציה (Deployment, Service, HPA, Ingress).

values-staging.yaml: ניהול קונפיגורציה ייעודית לסביבה.

📋 איך להריץ?
דרישות קדם: minikube, kubectl, helm, ו-argocd מותקנים.

Setup:

Bash
minikube start
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
Sync: הוסף את ה-Repository ל-ArgoCD והפעל Sync.
