	_cam = "camera" camCreate [0,0,1000];
	_cam cameraEffect ["internal","back"];
	ShowCinemaBorder true;

	if (side player == west) then {
		_cam camsettarget US12;
	 	US12 setCameraInterest 50;
		_cam camsetrelpos [400, 600, 100];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [700, 400, 100];
		_cam CamCommit 30;
		sleep 10;
	
		_cam camsettarget US12;
	 	US12 setCameraInterest 50;
		_cam camsetrelpos [400, 200, 30];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [10, 10, 10];
		_cam CamCommit 60;
	
		sleep 10;
	
		_cam camsettarget player;
	 	player setCameraInterest 50;
		_cam camsetrelpos [10, 10, 2];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [0, 0, 1];
		_cam CamCommit 30;
	
		sleep 1;
		titleText ["USA Base", "plain down"];
		sleep 7;
		//titleText ["", "black"];
		//sleep 1;

		_cam cameraEffect ["terminate","back"];
		camDestroy _cam;

	} else {
		_cam camsettarget RU1;
		_cam camsetrelpos [400, 400, 30];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [100, 100, 10];
		_cam CamCommit 30;
	
		sleep 10;

		_cam camsettarget RU8;
		_cam camsetrelpos [-400, 200, 30];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [400, 200, 5];
		_cam CamCommit 30;

		sleep 10;
	
		_cam camsettarget player;
		_cam camsetrelpos [50, 0, 2];
		_cam CamCommit 0;
		titleText ["", "plain"];
		_cam camsetrelpos [5, 5, 1];
		_cam CamCommit 30;
	
		sleep 1;
		titleText ["Russian Base", "plain down"];
		sleep 7;
		//titleText ["", "black"];
		//sleep 1;

		_cam cameraEffect ["terminate","back"];
		camDestroy _cam;
	};