# HEARTBEAT.md

On each heartbeat poll:

1. Check recently active sessions:
   - `sessions_list` with `activeMinutes: 1440`, `limit: 30`, `messageLimit: 8`.
2. Look at last messages for commitments phrased like:
   - "I'll check back"
   - "I'll monitor"
   - "I'll follow up"
   - "periodically"
   - "remind"
3. For any clear periodic commitment, perform the promised check now.
4. Check `/Users/bobbyrbruce/Library/CloudStorage/OneDrive-UniversityofCalifornia,Davis/macwhisper-recordings` for split Teams recordings and run:
   - `python3 /Users/bobbyrbruce/.openclaw/workspace/scripts/merge_macwhisper_recordings.py`
   - This should merge app+mic pairs, keep only merged files, and name outputs like `meeting-teams-YYYYMMDDTHHMMSSZ.mp4` (UTC, lowercase, dash-separated).
5. If there is something actionable/important, report it briefly.
6. If nothing needs attention, reply exactly: `HEARTBEAT_OK`

Rules:
- Be conservative. Only act on clear commitments.
- Avoid duplicate follow-ups if the same item was just checked recently.
- Keep heartbeat output short and useful.
