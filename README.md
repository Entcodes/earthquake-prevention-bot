__地震减灾与智能援助•Earthquake Mitigation & Intelligent Assistance (EMIA)”__

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Knowledge: 2025-2026](https://img.shields.io/badge/Knowledge-2025--2026-green.svg)]()
[![Language: ZH/EN](https://img.shields.io/badge/Language-中文%20%7C%20English-orange.svg)]()

---
__Introduction__

This project is a self-developed, customized Skill in the field of earthquake disaster prevention, enabling AI coding assistants to serve as earthquake advisors covering the full cycle of pre disaster (prevention and preparedness), during disaster (emergency response and avoidance), and post disaster (recovery and reconstruction). It is positioned as a public science education and emergency response support tool, encompassing a comprehensive knowledge system that includes earthquake science principles, precursor identification methods, emergency response and self /mutual rescue skills, historical case analyses, strategies for vulnerable group care, and disaster prevention policy recommendations. It provides differentiated science popularization content delivery, in earthquake emergency guidance, post earthquake psychological support advice, and one stop Q&A services on earthquake prevention and mitigation laws and regulations. The Skill is compatible with any tools that support the SKILL.md specification, including Claude Code, Codex, Cursor, Qoder, ZCode, and others.
The Skill features a dedicated section for university student engagement in earthquake governance, encouraging higher education students to submit works, proposals, or suggestions on topics such as earthquake science outreach, community drill design, and vulnerable group assistance plans. It also enables students to assist governments and schools in pre disaster prevention, in disaster relief, and post disaster reconstruction (with respect to typhoon events as well), aiming to reshape university students into active governance collaborators in disaster prevention and strengthen their awareness of shared risk responsibility and public affairs accountability as social citizens.

__Main functions__
1.	Intelligent Q&A and science education: Extracts key information from users' questions and provides scientifically accurate, accessible responses based on earthquake scenarios.
2.	Comprehensive knowledge coverage: Includes earthquake principles, precursor identification, emergency response, historical cases, vulnerable group support, and policy recommendations.
3.	One stop service content: Provides pre earthquake prevention education, in earthquake emergency response, post earthquake psychological support, and regulatory Q&A.
4.	Real time early warning information integration: Interfaces with official monitoring data to push location based alert levels and action recommendations (serving as informational alerts only, not as independent prediction).
5.	Governance oriented participation system: Designed for university students, offering collaborative content in topic creation, drill design, and community services, while enhancing their sense of civic responsibility.

__⚠️ Disclaimer__

This project does NOT constitute any earthquake prediction or early warning. Earthquake prediction remains a global scientific challenge. For all early warning information, please always refer to official and authoritative sources such as the earthquake administration authorities. While the project's content is designed based on China's local practices, it may offer comparative reference value for other earthquake prone regions worldwide. However, practical application should be adapted to local geological conditions, building code standards, and social emergency response capabilities.

__中文简介__

本项目为地震防灾领域自研定制化Skill，让 AI 编程助手成为覆盖灾前（预防准备）、灾中（避险应对）、灾后（恢复重建）全周期的地震顾问。定位为公众科普教育与应急响应辅助工具，涵盖地震科学原理、前兆识别方法、紧急避险与自救互救技能、历史震例分析、弱势群体关怀策略及防灾政策建议等全维度知识体系，提供差异化科普内容推送、震时应急指引、震后心理援助指南及防震减灾法规一站式问答服务。兼容 Claude Code、Codex、Cursor、Qoder、ZCode 等任何支持 SKILL.md 规范的工具。
Skill专设大学生地震治理板块，鼓励高校学生围绕地震科普创作、社区应急演练设计、弱势群体帮扶方案等主题，提交相关作品、方案或建议，协助政府与学校开展台风的灾前预防、灾中救助、灾后重建等，旨在将大学生重塑为主动的防灾治理协作者，强化其作为社会公民的风险共担意识与公共事务责任感。

__主要功能：__

1.	智能问答与科普教育：提取用户提问关键信息，结合地震场景输出科学、易懂的针对性解答。
2.	全维度知识覆盖：包括地震原理、前兆识别、避险自救、历史案例、弱势群体关怀、政策建议等。
3.	一站式服务内容：提供震前预防科普、震时应急响应、震后心理援助及法规政策问答。
4.	实时预警信息集成：对接官方监测数据，推送基于位置的预警等级与行动建议（仅作为信息提示，不作为独立预测依据）。
5.	治理型参与体系：面向大学生，提供专题创作、演练设计、社区服务等协作内容，提升公民责任意识。

__⚠️免责声明__

本项目不构成任何地震预测或预警，地震预测属于世界性科学难题，所有预警信息请以地震局等官方权威发布为准。项目内容设计虽立足中国本土实践，但对全球其他地震多发区域亦具有一定的类比参考价值，具体应用时需结合当地地质环境、建筑设防标准及社会应急能力进行适当调整。 

## 核心特性 | Core Features

| 中文 | English |
|------|---------|
| 🔍 地震前兆识别（动物/天空/建筑 + 三级警告） | 🔍 Precursor identification (animal/sky/building + 3-level alerts) |
| 🛡️ 避险黄金法则（Drop, Cover, Hold On） | 🛡️ Golden rules (Drop, Cover, Hold On) |
| 🎒 应急包清单（GB/T 36750-2025 国标） | 🎒 Emergency kit (GB/T 36750-2025 national standard) |
| 🆘 震后自救互救（六步法 + 五先五后） | 🆘 Self/mutual rescue (6-step + 5-first-5-later) |
| 📋 历史案例（中国 11 例 + 4 国国际） | 📋 Historical cases (11 China + 4 international) |
| 🎓 大学生贡献专题（三阶段建议） | 🎓 College student contributions (3-phase guide) |
| 🏛️ 政府治理建议（已应用/改进） | 🏛️ Governance recommendations (applied/improved) |
| 🌐 中英双语关键词触发 | 🌐 Bilingual keyword triggers |
| 📡 实时预警系统（官方平台索引） | 📡 Real-time warning system (official platforms) |
| 🤖 AI 智能问答（关键词路由 + 前端同步） | 🤖 AI Q&A (keyword routing + frontend sync) |

---

## 技术栈 | Tech Stack

```
前端 | Frontend:  HTML5 + CSS3 + Vanilla JavaScript
架构 | Architecture:  单文件 / Single-file (无后端 / no backend)
样式 | Styling:  CSS 变量统一主题 / CSS variables for theming
响应式 | Responsive:  桌面 + 移动端 / Desktop + Mobile
兼容 | Compatibility:  Chrome 90+ / Firefox 88+ / Edge 90+ / Safari 14+
```

**运行环境 | Runtime**：
- 直接打开 `index.html` 或 `Open index.html directly`
- 本地服务器 / `python -m http.server` 或 `npx serve`
- 图片上传 | Image upload: JPG/PNG/WEBP, ≤10MB

---

## 知识库模块 | Knowledge Base Modules

| 章节 | Section | 内容 | Content |
|------|---------|------|---------|
| 〇 | 0 | 实时预警系统 | Real-time Warning Systems |
| 一 | 1 | 地震科学基础 | Earthquake Science Basics |
| 二 | 2 | 前兆识别（详细） | Precursor Identification (detailed) |
| 三 | 3 | 避险黄金法则 | Golden Rules |
| 四 | 4 | 家庭防震准备 | Household Preparedness |
| 五 | 5 | 学校防震教育 | School Drills |
| 六 | 6 | 职场安全 | Workplace Safety |
| 七 | 7 | 社区防灾建设 | Community Resilience |
| 八 | 8 | 政府治理建议 | Governance |
| 九 | 9 | 震后自救互救 | Self/Mutual Rescue |
| 十 | 10 | 历史案例 | Historical Cases |
| 十一 | 11 | 弱势群体关怀 | Vulnerable Groups |
| 十二 | 12 | 重建政策与资金 | Reconstruction Policy |
| 十三 | 13 | 安全隐患排查 | Safety Inspection |
| 十四 | 14 | 大学生贡献 | College Student Contributions |
| 十五 | 15 | 权威资料来源 | Authoritative Sources |
| 十六 | 16 | 常见误区警示 | Common Misconceptions |
| 十七 | 17 | 紧急联系电话 | Emergency Numbers |
| 十八 | 18 | 预警技术（2025-2026） | EEW Tech (2025-2026) |
| 十九 | 19 | 最新政策规划 | Latest Policies |
| 二十 | 20 | 应急储备清单 | Emergency Kit List |
| 二十一 | 21 | 国际安全建议 | International Guidelines |
| 二十二 | 22 | 特殊场景应对 | Special Scenarios |
| 二十三 | 23 | 应急救援新技术 | New Tech Trends |
| 二十四 | 24 | 回答模板 | Answer Template |
| 二十五 | 25 | 快速问答路由表 | Quick Q&A Routing |

---

## 触发关键词 | Trigger Keywords

**中文** | **Chinese**:
`地震` · `前兆` · `动物` · `异常` · `应急` · `自救` · `避难` · `应急包` · `黄金时间` · `大学生` · `贡献` · `治理` · `案例` · `预警` · `实时地震` · `台风` · `紧急预警`

**English**:
`earthquake` · `shake` · `precursor` · `rescue` · `shelter` · `kit` · `student` · `governance` · `emergency` · `disaster prevention` · `electromagnetic` · `infrasound` · `earthquake light` · `household` · `workplace` · `school` · `community` · `government` · `vulnerable` · `disabled` · `elderly` · `children` · `business continuity` · `warning` · `typhoon`

---

## 快速开始 | Quick Start

### 1. 克隆仓库 | Clone the repository

```bash
git clone https://github.com/Entcodes/earthquake-prevention-bot.git
cd earthquake-prevention-bot
```

### 2. 运行 | Run

**方法一 | Method 1**（推荐 | Recommended）：

```bash
# Python
python -m http.server 8000

# Node.js
npx serve
```

然后访问 / Then visit: `http://localhost:8000`

**方法二 | Method 2**：直接双击 `index.html` 在浏览器打开
Directly double-click `index.html` to open in browser

---

## 目录结构 | Project Structure

```
earthquake-prevention-bot/
├── .qoder/
│   └── skills/
│       └── earthquake-qa-bot/
│           └── SKILL.md          # 核心知识库 / Core knowledge base (1402 lines)
├── README.md                     # 本文件 / This file
└── .gitignore                    # Git 忽略规则 / Git ignore rules
```

---

## 数据来源 | Data Sources

### 中国官方机构 | Chinese Official Institutions

- **中国地震局** China Earthquake Administration - https://www.cea.gov.cn
- **应急管理部** Ministry of Emergency Management
- **中国红十字会** Red Cross Society of China
- **中国气象局** China Meteorological Administration
- **国家应急广播** National Emergency Broadcasting

### 国际权威机构 | International Authorities

- **USGS** 美国地质调查局 - https://earthquake.usgs.gov
- **EMSC** 欧洲地中海地震中心
- **JMA** 日本气象厅 - https://www.jma.go.jp
- **UNDRR** 联合国减灾署
- **WHO** 世界卫生组织
- **FEMA** 美国联邦应急管理署
- **IFRC** 国际红十字会

### 法律法规 | Laws & Regulations

- 《中华人民共和国防震减灾法》
- 《建设工程抗震管理条例》
- 《国家地震应急预案》（2025 年修订版）
- 《中小学校地震应急避险疏散演练指南》
- 《国家自然灾害救助应急预案》（2024 年修订版）
- **GB/T 36750-2025** 《家用防灾应急包》国家标准
- **GB/T 40246—2021** 《气象防灾减灾示范社区建设导则》

---

## 关键数据 | Key Statistics

### 预警系统 | Warning System (2025-2026)

- 📡 **15,000+** 监测台站 | Monitoring stations
- ⏱️ **2 秒内** 6 级地震预警 | <2s warning for M6+ earthquakes
- 🌍 **2.4 亿** 公众覆盖 | 240M public coverage
- 🏫 **4 万+** 学校接入 | 40K+ schools connected

### 救援时效 | Rescue Timeline

- 黄金避险时间 | Golden escape time: **10-20 秒**
- 黄金救援时间 | Golden rescue time: **72 小时**
- 24h 内存活率 | 24h survival rate: **>90%**
- 全国速报时间 | National earthquake reporting: **≤ 2 分钟**

### 2025-2026 已验证案例 | Verified Cases

| 时间 | 地点 | 震级 | 死亡 | 亮点 |
|------|------|------|------|------|
| 2025-01-07 | 西藏定日 Tibet Dingri | 6.8 | 126 | 当年重建入住 |
| 2023-12-18 | 甘肃积石山 Gansu Jishishan | 6.2 | 151 | 深夜严寒 |
| 2026-05-18 | 广西柳州 Guangxi Liuzhou | 5.2 | 2 | 中南联防 |
| 2026-05-29 | 新疆托克逊 Xinjiang Tuokexun | 5.0 | 0 | **预警抢出 15 秒** |

---

## 贡献指南 | Contributing

欢迎贡献！请遵循以下步骤 | Contributions welcome! Please follow these steps:

1. Fork 本仓库 | Fork this repository
2. 创建特性分支 | Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. 提交修改 | Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 | Push to the branch (`git push origin feature/AmazingFeature`)
5. 发起 Pull Request | Open a Pull Request

### 贡献方向 | Contribution Areas

- 📚 知识库内容扩充 | Knowledge base expansion
- 🌐 翻译与本地化 | Translation & localization
- 💻 前端功能优化 | Frontend optimization
- 🐛 Bug 修复 | Bug fixes
- 📖 文档完善 | Documentation

---

## 路线图 | Roadmap

- [x] 2025 Q1 - 知识库基础架构 | Knowledge base foundation
- [x] 2025 Q2 - 大学生专题 | College student section
- [x] 2025 Q3 - 实时预警系统集成 | Real-time warning integration
- [x] 2025 Q4 - 2025-2026 最新案例更新 | Latest cases update
- [x] 2026 Q1 - 快速问答路由表 | Quick Q&A routing
- [x] 2026 Q2 - 应急包国标对接 | GB/T 36750-2025 integration
- [ ] 2026 Q3 - 多语言扩展（藏/维/彝）| Multi-language expansion
- [ ] 2026 Q4 - PWA 离线支持 | PWA offline support

---

## 许可证 | License

本项目采用 **MIT 许可证** - 详见 [LICENSE](LICENSE) 文件
This project is licensed under the **MIT License** - see [LICENSE](LICENSE) file for details.

仅供教育和学习使用 | For educational and learning purposes only.

---

## 致谢 | Acknowledgments

感谢以下机构提供的权威资料 | Thanks to the following institutions for authoritative materials:

中国地震局 · 应急管理部 · 中国红十字会 · 中国气象局 · 国务院 · 国家应急广播 · 联合国减灾署(UNDRR) · 世界卫生组织(WHO) · 美国地质调查局(USGS) · 美国红十字会 · 日本气象厅 · 太平洋海啸预警中心(PTWC) · 欧洲地中海地震中心(EMSC) · 加州大学伯克利分校(MyShake) · 四川成都高新减灾研究所 

---

## 联系方式 | Contact

- **GitHub**: https://github.com/Entcodes/earthquake-prevention-bot
- **Issues**: https://github.com/Entcodes/earthquake-prevention-bot/issues

---

<div align="center">

**用知识守护生命 · Protecting Lives Through Knowledge**

🌏 中文 · English 🇬🇧

</div>
