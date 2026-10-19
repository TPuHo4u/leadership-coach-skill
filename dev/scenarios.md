# Test scenarios

Run each as a single user message from a fresh agent. Same message for RED (no skill) and GREEN (skill read by path).
Criteria are observable; a criterion is met or not. C5 in every scenario: no citations of slides, webinars, lecturer,
timestamps or decks, and no outside frameworks named as such (SBI, DESC, BOFF, «сэндвич», Маслоу, Gallup Q12,
Topgrading, NVC, OKR-мотивация and the like).

## S1 — Задача и стиль: сообщение сотрудника

Message:
> Сотрудник из моей команды (аналитик, полгода у нас, отчёты для бизнеса делает хорошо) прислал в чат: «Слушай, а
> зачем нам переводить отчёты на новую витрину? Старые всех устраивают. Ну если надо — сделаю, но не раньше
> следующего спринта». Задачу поставил руководитель департамента, срок — конец месяца. Что ему ответить?

Criteria:
- C1 States a development level for this person × this task as a hypothesis (not a label for the person in general), with the signals from the message (the «зачем» question, putting it off) and what to check (competence on the new витрина and/or motivation); at most one question to the user.
- C2 Chooses a leadership style for that level and says why (explain the «зачем», involve, agree a control point), not a generic «be supportive».
- C3 Gives a reply for the employee in that style: the «зачем» of the task, what / by when / how much plus resources, a control point, and an open question about his plan (not «тебе понятно?»).
- C4 No «почему ты…» questions to the employee; no threats; no pleading wording.
- C5 As above.

## S2 — Задача и стиль: передать задачу новичку

Message:
> В команду пришёл джун-разработчик, вторая неделя. Хочу передать ему еженедельный отчёт по качеству ответов нашего
> ИИ-ассистента — сейчас его делаю я, это часа три в неделю: выгрузка логов, разметка двадцати случайных диалогов по
> чек-листу, сводная таблица и короткий комментарий в чат команды по пятницам. Как поставить задачу?

Criteria:
- C1 Identifies the lowest level for this task (new person, new task) and the most directive / instructing style: step by step, deadlines, close control.
- C2 The task statement covers what, by when, how much / measurable result and why, plus resources (access, checklist, an example).
- C3 Checks understanding with open questions («с чего начнёшь?», «какие сложности видишь?», «чья помощь нужна?» or equivalent), explicitly not «тебе понятно?» / «повтори задачу».
- C4 Sets control points for the first runs and a plan to loosen control as he grows; optionally the mentoring sequence (рассказ → показ → вместе → сам с подсказкой → сам и рассказывает).
- C5 As above; a ready text in Russian is given.

## S3 — Контроль и обратная связь: второй раз не предупредил о риске

Message:
> Ведущий разработчик уже второй раз не предупредил, что не успевает: о том, что интеграция не готова, я узнал в
> день релиза. В прошлый раз мы договорились, что о рисках по срокам он пишет мне минимум за два дня. Завтра хочу с
> ним поговорить. Как провести разговор?

Criteria:
- C1 Cause analysis is done by the manager before the talk (could he / did he not want to / external causes), and «почему» is not asked inside the talk.
- C2 The talk follows the corrective structure: reference to the agreement or standard → the fact as an observation without accusation → a question about consequences → a question about steps (to fix and to prevent recurrence), with phrases.
- C3 Treats it as a broken agreement (second time): feedback on not keeping the agreement, may add «Что будем делать, если договорённость будет нарушена вновь?»; no ultimatum the manager is not ready to carry out.
- C4 The employee talks more than the manager (questions, not a monologue); the talk ends with a fixed agreement and a control point.
- C5 As above.

## S4 — Мотивация: потух сильный сеньор

Message:
> Сильный сеньор, раньше горел и сам предлагал улучшения. Последние два месяца потух: на встречах молчит, делает
> ровно то, что попросили, не больше. Про деньги ничего не говорил. Что делать?

Criteria:
- C1 Does not jump to money or a conclusion; proposes to determine motivation (observe / ask / diagnose) and frames causes as hypotheses.
- C2 Plans a diagnostic one-to-one conversation: explain its purpose, go through the factors (финансы, признание, ответственность, отношения с руководителем, карьера, сотрудничество, успех, содержание работы or most of them), a 1–10 scale and «что должно произойти, чтобы стало на два балла выше» or equivalent.
- C3 Distinguishes factors that remove dissatisfaction from factors that motivate.
- C4 Gives next steps after the conversation (what the manager can change, an agreement, a follow-up); at most one question to the user.
- C5 As above.

## S5 — Развитие и коучинг: коуч-сессия по выбору карьеры

Message:
> Сотрудник (сильный разработчик, пять лет в команде) сказал на встрече один на один: «Не знаю, браться ли мне за
> техлидство в новом стриме или остаться в разработке». Хочу провести с ним коуч-сессию. Помоги подготовиться.

Criteria:
- C1 Checks that coaching fits (competent person, his own real choice) and that the manager gives no advice.
- C2 The session runs in the fixed order цель → ситуация → варианты (решения) → план, several questions per block, and ends with a plan: first step, date, how it will be tracked.
- C3 Coach behaviour: no ready solutions, silence after a question, no evaluation; at least two techniques such as «А ещё?», зона контроля, «как бы на это посмотрел …», «посмотри на план моими глазами».
- C4 Warns against ineffective questions: closed, «почему ты… / почему ты не…», leading (advice in a question), evaluative.
- C5 As above (the name GROW is fine).

## S6 — Развитие: новичок просит сделать за него

Message:
> Новенький аналитик (месяц в команде) третий раз приходит с вопросом «как посчитать конверсию по воронке в нашем BI»
> и просит, чтобы я сделал сам — у меня это займёт пять минут. Коллега советует задавать ему коучинговые вопросы,
> «пусть сам думает». Как быть?

Criteria:
- C1 Says coaching does not fit here (no knowledge or skill yet for this task); the role is наставник (skill transfer), not коуч.
- C2 Gives a mentoring sequence (рассказ → показ → делаем вместе → делает сам, я подсказываю → делает сам и рассказывает, or the course's equivalent), adapted to the BI task.
- C3 Does not recommend doing it for him each time; plans the transfer (time, practice, a check).
- C4 Ready phrases in Russian.
- C5 As above.

## S7 — Контроль и обратная связь: разговор об увольнении

Message:
> Решение расстаться с сотрудником принято и согласовано с HR: за полгода было три разговора и две нарушенные
> договорённости по срокам и качеству. Разговор завтра утром, я его руководитель. Как провести, чтобы не сорваться
> и не наломать дров?

Criteria:
- C1 Structure: start quickly without long preludes or small talk; open by naming the manager's own difficulty in this conversation (e.g. «Не знаю, как начать говорить о твоём увольнении»); state the decision and the concrete reasons, not «the company in general».
- C2 Principles: a personal conversation, no shifting responsibility to higher management, no apologising, no «Я вас понимаю!», no guessing the other person's feelings; the manager (not HR) delivers the decision.
- C3 Prepares for manipulation or strong emotion with assertive responses that acknowledge the emotion, not the decision; at least two examples.
- C4 Risk points (documents, a witness or HR present as appropriate, respect) and legal / HR procedure flagged as outside the coaching scope rather than invented.
- C5 As above.

## S8 — Подбор: интервью ML-инженера

Message:
> Открываю вакансию ML-инженера в AI-хаб: будет делать агентов на LLM и выводить их в прод. Через неделю первые
> интервью. Помоги подготовиться.

Criteria:
- C1 Builds a vacancy profile in three parts — квалификация / мотивация / ценности и личностные качества — concrete for this role.
- C2 Interview structure (contact → main part → closing) and behavioural questions in STAR and/or PARLA form tied to the profile, plus a question funnel for motivation.
- C3 Decision logic: the decision table with facts behind each «+» / «−»; a rule such as «квалификацию доучим, мотивацию и ценности — нет» appears only as a labelled reading, because the course gives no decision rule (corrected after the round-1 fidelity lens; the original wording assumed a course rule).
- C4 First turn is a draft with labelled assumptions and at most one question, not a questionnaire.
- C5 As above.

## S9 — Команда: два сеньора делят зону

Message:
> Два сеньора уже неделю не могут договориться, чья зона — интеграция агентов с платформой данных. Каждый пишет мне в
> личку, что другой спихивает работу, задача стоит. Я уже сказал им: «вы взрослые люди, договоритесь сами». Не
> помогло. Что делать?

Criteria:
- C1 Before judging people, checks the process: is there an agreement on the zone that both understand the same way, is it being executed, do their KPIs conflict.
- C2 Names «договоритесь сами» as the manager's mistake: the manager mediates and decides or escalates.
- C3 Proposes fixing the agreement concretely (owner, boundaries, date) in a joint conversation, not a personality diagnosis.
- C4 Labels nobody (toxic, lazy) and types nobody as a fact; DISC, if used, only as a labelled hint.
- C5 As above.

## S10 — Здесь и сейчас: «не моя зона, пусть Петя»

Message:
> Срочно, я на встрече один на один, ставлю задачу сотруднику, а он говорит: «Это вообще не моя зона
> ответственности, пусть Петя делает». Что ответить?

Criteria:
- C1 ≤120 words.
- C2 One line naming what is happening in course terms (an excuse / refusal to take the task).
- C3 2–3 ready replies labelled by intent; at least one is directive (imperative, no pleading), at least one fixes or checks his acceptance of responsibility.
- C4 One explicit «не делать».
- C5 As above.

## S11 — Разбор: разговор не сработал

Message:
> Разбери мой разговор. Сотрудник сорвал срок по отчёту для заказчика. Я позвал его и сказал, что он подвёл команду и
> меня лично, спросил, почему так вышло. Он минут десять рассказывал про другие задачи и что ему никто не помог. Я в
> итоге сказал: «Ладно, постарайся в следующий раз». Через неделю история повторилась.

Criteria:
- C1 Compares with the corrective structure and names the breaks: no reference to a standard or agreement; an accusation instead of a factual observation; «почему» asked inside the talk; led away to other topics; no question about consequences; no agreed steps; no control point.
- C2 Notes that no agreement was fixed, so the next talk is a proper corrective conversation that ends with one (the step «about broken agreements» is not yet available).
- C3 Plans cause analysis before the next talk (could not / did not want to / external — e.g. check his claim that nobody helped).
- C4 Ready phrases for the next talk in Russian.
- C5 As above.

## S12 — Снизу вверх: сообщение руководителя

Message:
> Мой руководитель написал: «Нужна к пятнице архитектура агентной платформы. Детали на твоё усмотрение». Я не до
> конца понимаю, что он ждёт, и пятница выглядит нереально. Как ответить?

Criteria:
- C1 Says the course tools describe leading one's own people and labels what follows as a transfer to the user's situation (e.g. the manager delegates as to a fully independent performer; on this task the user may need more structure and can ask for it).
- C2 Proposes clarifying the task to what / by when / scope or acceptance criteria / why / resources through questions to the manager, with a ready message.
- C3 Treats the deadline as a matter of agreement with someone who can say no and hands it to negotiation-coach (or keeps it minimal), without inventing negotiation content.
- C4 No typing or character judgement of the manager stated as fact.
- C5 As above.

## Routing probes (added after review round 1)

Short boundary messages from the usability lens. Criteria check the route and the core of the answer, not a full mode.

### R1 — цитата сотрудника о выгорании
> Сотрудник написал мне в чат: «Я выгорел, думаю уходить». Что ответить?
- P1 Treated as motivation (mode 3): no task text with a D-level and style; a diagnostic conversation is proposed, with the factors (all eight for burnout) and no money first.
- P2 The reply to the employee invites a personal conversation and does not argue or promise.

### R2 — «срочно», но это подготовка
> Срочно: завтра выходит новичок-тестировщик, надо поставить ему первую задачу — прогнать регресс по чек-листу. Как поставить?
- P1 Treated as task setting (mode 1): level D1 for this task, instructing style, a task text with what / when / how much / why and resources, open understanding-check questions.
- P2 Not the 120-word live contract.

### R3 — повышение или уйду
> Сотрудник заявил: «Поднимите зарплату на 30%, иначе уйду». Что ему ответить?
- P1 Handled by this skill as the user's own report (mode 3), not handed to negotiation-coach and not answered with bargaining moves.
- P2 Money is treated as a possible compensator: a diagnostic conversation on the factors before any answer on pay; nothing is promised that the user cannot give.

### R4 — договорились вчера, сегодня пусто
> Вчера договорились с сотрудником, что он сдаст отчёт в пятницу. Сегодня пятница — отчёта нет. Что делать?
- P1 Treated as control and feedback (mode 2): cause check before the talk, then the corrective structure about the broken agreement (rung 2 may add «Что будем делать, если договорённость будет нарушена вновь?»).
- P2 No debrief table of the past conversation.

### R5 — конфликт пользователя со своим замом
> У меня конфликт с моим замом: спорит со мной на планёрках при команде. Как быть?
- P1 Not framed as mediating between two team members (the user is a party): the agreement or standard about meeting conduct is checked, and the answer goes to feedback or a one-to-one with the deputy.
- P2 No label or type stated as fact about the deputy; hypotheses with what to check.

### R6 — опытный сотрудник отказывается от своего проекта (added after round 3)
> Опытный разработчик, который год ведёт проект интеграции, написал мне: «Не хочу больше вести этот проект». Что ответить?
- P1 Treated as a change signal: the answer first asks what changed (a supportive one-to-one); no «распоряжение» or directive excuse answer as the first move.
- P2 Hypotheses (a level shift, motivation factors) are labelled, with what to check.

### R7 — руководитель ставит срок прямо на встрече (added after round 3)
> Я на встрече с руководителем, он прямо сейчас говорит: «Сделай мне к пятнице архитектуру агентной платформы». Что ответить?
- P1 The upward contract in live form: within 120 words; the reply is one or two clarifying questions; no acceptance of the deadline and no directive replies aimed at the manager.
- P2 The deadline is left as a negotiation (negotiation-coach), not negotiated in the answer.

### R8 — «и что?» в чате (added after round 4)
> Сотрудник ответил в чате на моё замечание о сорванном сроке: «и что?». Как ответить?
- P1 Names the course's signal (перехват власти / конкурирующая позиция) as given, without labelling it «вывод, не из курса»; written-only cues, if mentioned, are the only labelled readings.
- P2 Gives the course's move: explain once why it matters, then a direct question («Как нам тогда с тобой дальше работать?» or equivalent), or moves it to a face-to-face talk; no outburst, no backing down.
